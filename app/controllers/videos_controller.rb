class VideosController < ApplicationController
  include ApplicationHelper

  def index
    # グループごとに表示する動画を取得
    @groups_belong_to = GroupUser.where(user_id: @current_user.id)
    @group_videos = []
    
    # 各グループの動画を取り出す
    @groups_belong_to.each do |group_belong_to|
      # グループに動画がない場合は追加しない
      if Video.find_by(group_id: group_belong_to.group_id) != nil
        @group_videos << Video.where(group_id: group_belong_to.group_id)
      end
    end

    # 各グループの動画をひとつのオブジェクトに格納
    num = @group_videos.length - 1
    @videos = []
    for i in 0..num
      for @group_video in @group_videos[i] do
        @videos << @group_video
      end
      ++i
    end

    # 作成日時の降順で並べ替え
    @videos = @videos.sort { |a,b|
      b.created_at <=> a.created_at
    }

  end

  def new
    @groupUsers = GroupUser.where(user_id: @current_user.id)
  end

  def create
    video = params[:video]
    @group_id = params[:group_id]

    # 未選択のバリデーションをかける
    if video == nil || @group_id == "未選択"
      flash[:notice] = "動画またはグループが選択されていません"
      @groupUsers = GroupUser.where(user_id: @current_user.id)
      render :new
      return
    end

    Video.transaction do
        # videoインスタンスの作成
        @video = Video.new(
          user_id: @current_user.id,
          group_id: @group_id,
          color: set_random_color
          )
        @video.save!

        # ディレクトリを作成
        @group_created_at = Group.find_by(id: @group_id).created_at
        @group_created_at = timestamp_to_number(@group_created_at)
        if !Dir.exist?("public/" + @group_created_at)
          Dir.mkdir("public/" + @group_created_at)
        end

        # videoのパスを作成
        @video_path = "/#{@group_created_at}/#{@video.id}.mp4"
        @video.video_path = @video_path
        @video.save!
    end
        # save!に成功した場合の処理
        File.binwrite("public#{@video_path}", video.read)
        flash[:notice] = "投稿に成功しました"
        redirect_to("/index")
  rescue => e
        # save!に失敗した場合の処理
        flash[:notice] = "動画の保存に失敗しました。再度投稿をお願いします"
        render :new
  end

  def destroy
    @video = Video.find_by(id: params[:id])

    if @video.destroy
      FileUtils.rm_f("public#{@video.video_path}")
      flash[:notice] = "動画を削除しました"
      redirect_to("/index")
    end
  end
end

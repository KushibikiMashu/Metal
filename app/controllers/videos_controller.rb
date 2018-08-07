class VideosController < ApplicationController
  include ApplicationHelper

  def index
    @videos = Video.all.order(created_at: :desc)
  end

  def new
    @groupUsers = GroupUser.where(user_id: @current_user)
  end

  def create
    video = params[:video]
    @group_id = params[:group_id]

    # バリデーションをかける
    if video == nil || @group_id == nil
      flash[:notice] = "動画またはグループが選択されていません"
      @groupUsers = GroupUser.where(user_id: @current_user)
      render :new
      return
    end

    # videoインスタンスの作成
    @video = Video.new(
      user_id: @current_user.id,
      group_id: @group_id,
      color: set_random_color
      )

    if @video.save
      # TODO mp4以外の動画がアップされた時の対応をする
      @group_created_at = Group.find_by(id: @group_id).created_at
      @group_created_at = timestamp_to_number(@group_created_at)

      # TODO @group_created_atの名前のディレクトリを作成する
      @video_path = "/#{@group_created_at}/#{@video.id}.mp4"
      @video.video_path = @video_path
      binding.pry
      File.binwrite("public#{@video_path}", video.read)

      flash[:notice] = "投稿に成功しました"
      redirect_to("/index")
    else
      flash[:notice] = "動画の保存に失敗しました。再度投稿をお願いします"
      render :new
    end
  end

  def destroy
    @video = Video.find_by(id: params[:id])

    if @video.destroy
      FileUtils.rm_f("public/test_video/#{@video.id}.mp4")
      flash[:notice] = "動画を削除しました"
      redirect_to("/index")
    end
  end
end

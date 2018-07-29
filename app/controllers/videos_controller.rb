class VideosController < ApplicationController
  def index
    @videos = Video.all.order(created_at: :desc)
  end

  def new
  end

  def create
    video = params[:video]

    # TODO group_idを追加
    @video = Video.new(
      user_id: @current_user.id
      )

    if video === nil
      flash[:notice] = "動画が選択されていません"
      render :new
      return
    end

    if @video.save
      File.binwrite("public/test_video/#{@video.id}.mp4", video.read)
      flash[:notice] = "投稿に成功しました"
      redirect_to("/index")
    else
      flash[:notice] = "動画の保存に失敗しました。再度投稿をお願いします"
      render :new
    end

    # グループ機能を開発した後に利用するコード
    # group_id = params[:group_id]

    # @video = Video.new(
    #   user_id: @current_user.id,
    #   group_id: group_id
    #   )

    # if video === nil || gropu_id === nil
    #   flash[:notice] = "動画またはグループが選択されていません"
    #   render("/videos/new")
    #   return
    # end

    # グループが作成されたときにディレクトリが作成されるようにする
    # 公開、非公開でディレクトリを分ける
    # File.binwrite("public/(public/, private/)#{@video.group_id}/#{@video.id}.mp4", video.read)

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

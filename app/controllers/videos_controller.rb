class VideosController < ApplicationController
  def index
  end

  def new
  end

  def create
    video = params[:video]

    if video
      File.binwrite("public/test_video/001.mp4", video.read)
      flash[:notice] = "投稿に成功しました"
      redirect_to("/index")
    else
      flash[:notice] = "動画が選択されていません"
      render("videos/new")
    end

    # @video = Video.new(
    #   user_id: @current_user.id
    #   )

    # ログイン機能を開発後にコメントアウトを外す
    # if @video.save
    #   # File.binwrite("public/test_video/#{@video.created_at}.mp4", video.read)
      # File.binwrite("public/test_video/001.mp4", video.read)
      # flash[:notice] = "投稿に成功しました"
      # redirect_to("/index")
    # else
    #   render("videos/new")
    # end

    # グループ機能を開発した後に利用するコード
    # group_id = params[:group_id]

    # if !gropu_id
    #   flash[:notice] = "グループが選択されていません"
    #   render("/videos/new")
    # end

    # @video = Video.new(
    #   user_id: @current_user.id,
    #   group_id: group_id
    #   )

    # フォルダを作成
    # "#{@gropu_id}/#{@video_id}"
    # → groupを作成したときにディレクトリが作られるようにする

    # File.binwrite("public/test_video/#{@user_id}_#{@video_id}.mp4", video.read)
  end
end

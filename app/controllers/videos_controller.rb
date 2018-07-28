class VideosController < ApplicationController
  def index
  end

  def new
  end

  def create
  	video = params[:video]

    if video
      File.binwrite("public/test_video/001.mp4", video.read)
      flash[:notice] = "投稿に成功しました" #
      redirect_to('/index')
    else
      flash[:notice] = "動画が選択されていません"
      render '/videos/new'
    end
  end
end

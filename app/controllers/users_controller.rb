class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(
    	name: params[:name],
    	password: params[:password],
    	email: params[:email]
    	)

    if @user.save
    	flash[:notice] = "ユーザー登録が完了しました"
    	redirect_to("/index")
    else
    	flash[:notice] = "ユーザー登録に失敗しました"
    	render("new")
    end
  end

end

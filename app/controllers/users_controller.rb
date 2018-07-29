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

  def login_form
  end
  
  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
      )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("login_form")
    end
  end
  
  def logout
  end

end

class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create

    if params[:password] != params[:check_password]
      @error_message = "パスワードが一致していません"
      @email = params[:email]
      render :new
      return
    end

    @user = User.new(
    	user_name: params[:name],
    	password: params[:password],
    	email: params[:email],
      image_path: "default.jpg"
    	)

    if @user.save
      session[:user_id] = @user.id
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
      render("login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login_form")
  end

end

class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(
    	user_name: params[:user_name],
    	email: params[:email],
      password: params[:password],
      image_path: "default.jpg"
    	)

    if @user.save
      session[:user_id] = @user.id
    	flash[:notice] = "ユーザー登録が完了しました"
    	redirect_to("/index")
    else
      @user_name = params[:user_name]
      @email = params[:email]
    	flash[:notice] = "ユーザー登録に失敗しました"
    	render :new
    end
  end

  def login_form
  end
  
  def login
    flash[:notice] = nil

    @user = User.find_by(
      email: params[:email],
      password: params[:password]
      )

      # binding.pry

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
    remove_instance_variable(:@current_user)
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    render :login_form
  end

end

class GroupsController < ApplicationController

  def index
  end

  def new
  end

  def create
  	@name = params[:name]

  	if @name == nil
  		flash[:notice] = "グループ名が入力されていません"
	  	render("groups/new")
  	end

    @group = Group.new(
      name: @name
      )

  	if @group.save

      # グループメンバーテーブルにデータを保存

      # ユーザーテーブルにデータを保存
      @user = User.find_by(id: @current_user)
      @user.group_id = @group.id
      @user.save

  		flash[:notice] = "グループが作成されました"
	  	redirect_to("/index")
	  else
  		flash[:notice] = "グループの作成に失敗しました"
	  	render("groups/new")
  	end
  end

end

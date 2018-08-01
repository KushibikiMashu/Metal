class GroupsController < ApplicationController

  def index
    @groupMembers = GroupMember.where(user_id: @current_user.id).order(created_at: :desc)
    # binding.pry
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
      group_name: @name
      )

  	if @group.save

      # グループメンバーテーブルにデータを保存
      @group_member = GroupMember.new(
          group_id: @group.id,
          user_id: @current_user.id
        )
      @group_member.save

      # ユーザーテーブルにデータを保存
      @user = User.find_by(id: @current_user)
      @user.save

  		flash[:notice] = "グループが作成されました"
	  	redirect_to("/index")
	  else
  		flash[:notice] = "グループの作成に失敗しました"
	  	render("groups/new")
  	end
  end

  def show

  end

end

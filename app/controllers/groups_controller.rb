class GroupsController < ApplicationController
  include ApplicationHelper

  def index
    @groupUsers = GroupUser.where(user_id: @current_user.id).order(created_at: :desc)
  end

  def new
  end

  def create
  	@group_name = params[:group_name]

    @group = Group.new(
      group_name: @group_name,
      admin_user_id: @current_user.id
      )

  	if @group.save
      # グループメンバーテーブルにデータを保存
      @group_user = GroupUser.new(
          group_id: @group.id,
          user_id: @current_user.id,
          status: 1
        )
      @group_user.save

      # ユーザーテーブルにデータを保存
      @user = User.find_by(id: @current_user)
      @user.save

      @created_at = timestamp_to_number(@group.created_at)
      if !Dir.exist?("public/" + @created_at)
        Dir.mkdir("public/" + @created_at)
      end

  		flash[:notice] = "グループが作成されました"
      redirect_to("/groups")
	  else
  		flash[:notice] = "グループの作成に失敗しました"
      redirect_to("/groups/new")
  	end
  end

  def show 
  end

  def destroy
    @group_id = params[:group_id]
    @group = Group.find_by(group_id: @group_id)

    # confirmで「本当に削除しますか？」と確認する
    if @group.destroy
      flash[:notice] = "グループを削除しました"
      redirect_to("/groups")
    else
      flash[:notice] = "グループ削除ができませんでした"
      redirect_to("/groups")
    end

  end

  def search
    @results = Group.search(params[:search])

    if @results == []
      @error_message = "検索結果はありません"
    end
  end

  def join
    @group_id = params[:group_id]
    @group_user = GroupUser.new(
        group_id: @group_id,
        user_id: @current_user.id,
        status: 0
      )

    if @group_user.save
      flash[:notice] = "参加申請が完了しました"
      redirect_to("/groups")
    else
      flash[:notice] = "参加申請ができませんでした"
      redirect_to("/groups")
    end
  end

  def permit
    @user_id = params[:user_id]
    @groupUser = GroupUser.find_by(user_id: @user_id)
    @groupUser.status = 1
    @groupUser.save

    redirect_to("#")
  end

  def withdraw
    @user_id = params[:user_id]
    @groupUser = GroupUser.find_by(user_id: @user_id)

    # confirmで「本当に退会しますか？」と確認する
    if @groupUser.destroy
      flash[:notice] = "グループ退会が完了しました"
      redirect_to("/groups")
    else
      flash[:notice] = "グループ退会ができませんでした"
      redirect_to("/groups")
    end
  end
end

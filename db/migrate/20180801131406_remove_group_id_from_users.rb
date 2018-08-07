class RemoveGroupIdFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_columns :users, :group_id, :string

  	rename_column :users, :name, :user_name
  	rename_column :groups, :name, :group_name

  end
end

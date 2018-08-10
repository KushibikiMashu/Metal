class AddColumnStatusToGroupUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :group_users, :status, :integer
  end
end

class RemoveUserIdFromGroups < ActiveRecord::Migration[5.2]
  def change
  	remove_column :groups, :user_id, :integer
  end
end

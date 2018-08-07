class RemoveGroupMemberTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :group_members
  end
end

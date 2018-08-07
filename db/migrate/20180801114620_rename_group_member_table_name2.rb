class RenameGroupMemberTableName2 < ActiveRecord::Migration[5.2]
  def change
  	rename_table :roupmembers, :groupmembers
  end
end

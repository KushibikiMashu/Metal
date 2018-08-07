class RenameGroupMemberTableName < ActiveRecord::Migration[5.2]
  def change
  	rename_table :Groupmembers, :roupmembers
  end
end

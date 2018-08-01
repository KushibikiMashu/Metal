class RenameGroupUserTableName < ActiveRecord::Migration[5.2]
  def change
  	rename_table :Group_Members, :Groupmembers
  end
end

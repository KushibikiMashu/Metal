class DeleteGroupmemberTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :groupmembers
  end
end

class RemoveStatusFromGroups < ActiveRecord::Migration[5.2]
  def change
  	remove_column :groups, :status, :integer
  end
end

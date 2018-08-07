class RemoveNameFromVideo < ActiveRecord::Migration[5.2]
  def change
  	remove_column :videos, :name, :string
  end
end

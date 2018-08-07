class AddColumnsToGroup < ActiveRecord::Migration[5.2]
  def change
  	remove_columns :groups, :tag_id, :string
  end
end

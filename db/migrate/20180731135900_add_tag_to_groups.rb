class AddTagToGroups < ActiveRecord::Migration[5.2]
  def change
  	add_column :groups, :tag_id, :string
  end
end

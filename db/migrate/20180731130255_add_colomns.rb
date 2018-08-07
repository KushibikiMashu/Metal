class AddColomns < ActiveRecord::Migration[5.2]
  def change
  	add_column :videos, :group_id, :string
  	add_column :videos, :video_path, :string
  	add_column :users, :image_path, :string
  end
end

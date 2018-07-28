class ChangeUserIdTypeOnVideos < ActiveRecord::Migration[5.2]
  def change
  	remove_column :videos, :user_id, :string
  	add_column :videos, :user_id, :integer
  	add_column :videos, :video_id, :integer
  end
end

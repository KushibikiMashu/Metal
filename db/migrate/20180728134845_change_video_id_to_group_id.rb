class ChangeVideoIdToGroupId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :videos, :video_id, :integer
  	add_column :videos, :group_id, :integer
  end
end

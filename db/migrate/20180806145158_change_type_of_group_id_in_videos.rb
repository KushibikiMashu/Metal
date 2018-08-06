class ChangeTypeOfGroupIdInVideos < ActiveRecord::Migration[5.2]
  def change
  	change_column :videos, :group_id, :integer
  end
end

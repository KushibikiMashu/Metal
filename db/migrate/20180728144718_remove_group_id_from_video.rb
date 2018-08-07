class RemoveGroupIdFromVideo < ActiveRecord::Migration[5.2]
  def change
  	# 仮開発の間はグループ機能を利用しない
  	remove_column :videos, :group_id, :string
  end
end

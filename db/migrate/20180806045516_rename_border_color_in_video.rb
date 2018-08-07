class RenameBorderColorInVideo < ActiveRecord::Migration[5.2]
  def change
  	rename_column :videos, :border_color, :color
  end
end

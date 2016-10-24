class AddRowOrderToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :row_order, :integer
    add_index :videos, :row_order
  end
end

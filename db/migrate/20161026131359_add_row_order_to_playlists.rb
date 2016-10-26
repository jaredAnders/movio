class AddRowOrderToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :row_order, :integer
    add_index :playlists, :row_order
  end
end

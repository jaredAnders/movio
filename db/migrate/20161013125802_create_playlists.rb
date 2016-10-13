class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title
      t.integer :channel_id
      t.timestamps
    end

    add_index :playlists, :channel_id
  end
end

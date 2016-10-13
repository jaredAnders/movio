class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description

      t.integer :playlist_id
      t.timestamps
    end

    add_index :videos, :playlist_id
  end
end

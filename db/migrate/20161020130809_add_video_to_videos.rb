class AddVideoToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :video, :string
  end
end

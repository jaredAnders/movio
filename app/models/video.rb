class Video < ActiveRecord::Base
  belongs_to :playlist
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, :with_same => :playlist_id

  validates :title, presence: true
  validates :description, presence: true
end

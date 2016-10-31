class Video < ActiveRecord::Base
  belongs_to :playlist
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, :with_same => :playlist_id

  validates :title, presence: true
  validates :description, presence: true

  def next_video
    video = playlist.videos.where("row_order > ?", self.row_order).rank(:row_order).first
    if video.blank? && playlist.next_playlist
      return playlist.next_playlist.videos.rank(:row_order).first
    end
    video
  end
end

class Playlist < ActiveRecord::Base
  belongs_to :channel
  has_many :videos, dependent: :destroy

  include RankedModel
  ranks :row_order, :with_same => :channel_id

  validates :title, presence: true

  def next_playlist
    playlist = channel.playlists.where("row_order > ?", self.row_order).rank(:row_order).first
  end
end

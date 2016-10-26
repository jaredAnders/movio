class Playlist < ActiveRecord::Base
  belongs_to :channel
  has_many :videos

  include RankedModel
  ranks :row_order, :with_same => :channel_id

  validates :title, presence: true
end

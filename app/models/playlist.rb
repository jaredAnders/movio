class Playlist < ActiveRecord::Base
  belongs_to :channel
  has_many :videos

  validates :title, presence: true
end

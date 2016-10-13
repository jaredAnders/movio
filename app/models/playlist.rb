class Playlist < ActiveRecord::Base
  belongs_to :channel

  validates :title, presence: true
end

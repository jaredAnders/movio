class Video < ActiveRecord::Base
  belongs_to :playlist
  mount_uploader :video, VideoUploader

  validates :title, presence: true
  validates :description, presence: true
end

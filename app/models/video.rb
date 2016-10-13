class Video < ActiveRecord::Base
  belongs_to :playlist

  validates :title, presence: true
  validates :description, presence: true
end

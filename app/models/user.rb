class User < ActiveRecord::Base
  has_many :channels
  has_many :subscriptions
  has_many :subscribed_channels, through: :subscriptions, source: :channel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def subscribed?(channel)
    subscribed_channels.include?(channel)
  end
end

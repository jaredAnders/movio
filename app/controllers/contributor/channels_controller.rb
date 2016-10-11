class Contributor::ChannelsController < ApplicationController
  before_action :authenticate_user!

  def new
    @channel = Channel.new
  end
end

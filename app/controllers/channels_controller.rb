class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end
end

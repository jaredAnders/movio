class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
  end

  private

  helper_method :current_channel
  def current_channel
    @current_channel ||= Channel.find(params[:id])
  end

end

class Contributor::ChannelsController < ApplicationController
  before_action :authenticate_user!

  def new
    @channel = Channel.new
  end

  def create
    @channel = current_user.channels.create(channel_params)
    redirect_to contributor_channel_path(@channel)
  end

  def show
    @channel = Channel.find(params[:id])
  end

  private

  def channel_params
    params.require(:channel).permit(:title, :description, :cost)
  end
end

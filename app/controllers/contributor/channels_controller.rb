class Contributor::ChannelsController < ApplicationController
  before_action :authenticate_user!

  def new
    @channel = Channel.new
  end

  def create
    @channel = current_user.channels.create(channel_params)
    if @channel.valid?
      redirect_to contributor_channel_path(@channel)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @channel = Channel.find(params[:id])
  end

  private

  def channel_params
    params.require(:channel).permit(:title, :description, :cost)
  end
end

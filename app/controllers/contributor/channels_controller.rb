class Contributor::ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth, only: [:show, :update]

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
    @playlist = Playlist.new
    @video = Video.new
  end

  def update
    current_channel.update_attributes(channel_params)
    if current_channel.valid?
      redirect_to contributor_channel_path(current_channel)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def require_auth
    if current_channel.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_channel
  def current_channel
    @current_channel ||= Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:title, :description, :cost, :image)
  end
end

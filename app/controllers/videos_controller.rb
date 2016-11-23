class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_subscription

  def show
  end

  private

  def require_subscription
    if !current_user.subscribed?(current_channel)
      redirect_to channel_path(current_channel), alert: 'Please subscribe to view videos'
    end
  end

  helper_method :current_video, :current_channel
  def current_video
    @current_video ||= Video.find(params[:id])
  end

  def current_channel
    @current_channel ||= current_video.playlist.channel
  end


end

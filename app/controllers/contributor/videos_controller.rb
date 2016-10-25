class Contributor::VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth_for_section, only: [:new, :create]
  before_action :require_auth_for_video, only: [:update]

  def new
    @video = Video.new
  end

  def create
    @video = current_playlist.videos.create(video_params)
    redirect_to contributor_channel_path(current_playlist.channel)
  end

  def update
    current_video.update_attributes(video_params)
    render text: 'updated!'
  end

  private

  def require_auth_for_video
    if current_video.playlist.channel.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  def current_video
    @current_video ||= Video.find(params[:id])
  end

  def require_auth_for_section
    if current_playlist.channel.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_playlist
  def current_playlist
    @current_playlist ||= Playlist.find(params[:playlist_id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :video, :row_order_position)
  end
end

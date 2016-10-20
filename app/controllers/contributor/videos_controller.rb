class Contributor::VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth

  def new
    @video = Video.new
  end

  def create
    @video = current_playlist.videos.create(video_params)
    redirect_to contributor_channel_path(current_playlist.channel)
  end

  private

  def require_auth
    if current_playlist.channel.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_playlist
  def current_playlist
    @current_playlist ||= Playlist.find(params[:playlist_id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :video)
  end
end

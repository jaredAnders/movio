class Contributor::PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_channel.playlists.create(playlist_params)
    redirect_to contributor_channel_path(current_channel)
  end

  private

  def require_auth
    if current_channel.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_channel
  def current_channel
    @current_channel ||= Channel.find(params[:channel_id])
  end

  def playlist_params
    params.require(:playlist).permit(:title)
  end
end

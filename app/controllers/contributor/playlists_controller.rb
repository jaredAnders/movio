class Contributor::PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth_for_channel, only: [:new, :create]
  before_action :require_auth_for_playlist, only: [:update]

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_channel.playlists.create(playlist_params)
    redirect_to contributor_channel_path(current_channel)
  end

  def update
    current_playlist.update_attributes(playlist_params)
    render text: "Updated"
  end

  private

  def require_auth_for_playlist
    if current_playlist.channel.user != current_user
      render text: "Unauthorized", status: :unauthorized
    end
  end

  def current_playlist
    @current_playlist ||= Playlist.find(params[:id])
  end

  def require_auth_for_channel
    if current_channel.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_channel
  def current_channel
    if params[:channel_id]
      @current_channel ||= Channel.find(params[:channel_id])
    else
      current_playlist.channel
    end
  end

  def playlist_params
    params.require(:playlist).permit(:title, :row_order_position)
  end
end

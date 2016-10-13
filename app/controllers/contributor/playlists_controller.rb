class Contributor::PlaylistsController < ApplicationController
  def new
    @channel = Channel.find(params[:channel_id])
    @playlist = Playlist.new
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @playlist = @channel.playlists.create(playlist_params)
    redirect_to contributor_channel_path(@channel)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:title)
  end
end

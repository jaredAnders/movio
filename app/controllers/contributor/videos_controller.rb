class Contributor::VideosController < ApplicationController
  def new
    @playlist = Playlist.find(params[:playlist_id])
    @video = Video.new
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @video = @playlist.videos.create(video_params)
    redirect_to contributor_channel_path(@playlist.channel)
  end

  private

  def video_params
    params.require(:video).permit(:title, :description)
  end
end

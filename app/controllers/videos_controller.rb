class VideosController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  private

  helper_method :current_video
  def current_video
    @current_video ||= Video.find(params[:id])
  end
end

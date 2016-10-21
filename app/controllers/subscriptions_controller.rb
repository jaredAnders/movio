class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.subscriptions.create(channel: current_channel)
    redirect_to channel_path(current_channel)
  end

  private

  def current_channel
    @current_channel ||= Channel.find(params[:channel_id])
  end

end

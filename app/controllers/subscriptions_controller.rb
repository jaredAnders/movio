class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_channel.premium?
      # Amount in cents
      @amount = (current_channel.cost * 100).to_i

      customer = Stripe::Customer.create(
        :email => current_user.email,
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => "Movio Subscription - #{current_channel.title}",
        :currency    => 'usd'
      )
    end

    current_user.subscriptions.create(channel: current_channel)
    redirect_to channel_path(current_channel)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to channel_path(current_channel)
  end

  private

  def current_channel
    @current_channel ||= Channel.find(params[:channel_id])
  end

end

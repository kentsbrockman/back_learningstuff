class Stripe::OnetimepaymentsController < ApplicationController

  def new
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: "Payment for a new subscription",
          amount: @total.to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      success_url: stripe_onetimepayments_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: stripe_onetimepayments_cancel_url
    )

    puts @session

    respond_to do
      render json: @session
    end
  end

  def success
    puts "Stripe session --> SUCCESS"
  end

  def cancel
    puts "Stripe Session --> CANCEL"
  end
end

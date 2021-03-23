class Stripe::OneTimePaymentsController < ApplicationController
  def create
    total = params[:total]
    learning_path = params[:learningPath]
    session =
      Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          {
            price_data: {
              unit_amount: total,
              currency: 'eur',
              product_data: {
                name: learning_path
              }
            },
            quantity: 1
          }
        ],
        mode: 'payment',
        success_url:
          stripe_one_time_payments_success_url +
            '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: stripe_one_time_payments_cancel_url
      )

    render json: session
  end

  def success
    puts 'Stripe session --> SUCCESS'
    #current_user.subscribe(learning_path)
  end

  def cancel
    puts 'Stripe Session --> CANCEL'
  end
end

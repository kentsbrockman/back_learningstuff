class Stripe::OneTimePaymentsController < ApplicationController

  def create
    total = params[:total]
    learning_path = LearningPath.find(params[:learningPath])
    session =
    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      metadata: {learning_path: learning_path.id},
      line_items: [
        {
          price_data: {
            unit_amount: total,
            currency: 'eur',
            product_data: {
              name: learning_path.title
            }
          },
          quantity: 1
        }
      ],
      mode: 'payment',
      customer: current_user.customer_stripe_id,
      client_reference_id: current_user.id,
      success_url:
      stripe_one_time_payments_success_url +
      '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: stripe_one_time_payments_cancel_url
    )
    render json: session
  end

  def success
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    user = User.find(session.client_reference_id)
    learning_path = LearningPath.find(session.metadata.learning_path)
    customer_stripe_id = session.customer
    total_amount = session.amount_total
    user.subscribe(learning_path, customer_stripe_id, total_amount)
    create_invoice(customer_stripe_id, total_amount, learning_path.title)
  end

  def cancel
  end

  private

  def create_invoice(customer_stripe_id, total_amount, description)
    invoice_item = Stripe::InvoiceItem.create({
      customer: customer_stripe_id,
      description: description,
      amount: total_amount,
      currency: 'eur',
    })

    invoice = Stripe::Invoice.create({
      customer: customer_stripe_id,
      auto_advance: false,
    })

    finalize_invoice = Stripe::Invoice.finalize_invoice(invoice.id)
  end

end

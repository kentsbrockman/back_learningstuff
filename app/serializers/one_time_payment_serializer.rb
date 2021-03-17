class OneTimePaymentSerializer
  include JSONAPI::Serializer
  attributes :total_amount, :product_stripe_id
  belongs_to :subscription
end

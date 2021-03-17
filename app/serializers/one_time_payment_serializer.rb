class OneTimePaymentSerializer < ActiveModel::Serializer 
  attributes :id,:total_amount, :product_stripe_id
  belongs_to :subscription
end

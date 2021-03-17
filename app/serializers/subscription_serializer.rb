class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes
  has_one :one_time_payment
  belongs_to :user
  belongs_to :learning_path
  has_many :progress_states
end
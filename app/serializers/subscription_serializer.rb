class SubscriptionSerializer < ActiveModel::Serializer 
  attributes :id
  has_one :one_time_payment
  belongs_to :user
  belongs_to :learning_path
  has_many :progress_states
end

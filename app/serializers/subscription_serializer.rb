<<<<<<< HEAD
class SubscriptionSerializer < ActiveModel::Serializer 
  attributes :id,
=======
class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes
>>>>>>> master
  has_one :one_time_payment
  belongs_to :user
  belongs_to :learning_path
  has_many :progress_states
end

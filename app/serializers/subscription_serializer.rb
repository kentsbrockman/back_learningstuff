class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :current_lesson
  has_one :one_time_payment
  belongs_to :user
  belongs_to :learning_path
end

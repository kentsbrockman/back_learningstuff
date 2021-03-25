class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :current_lesson
  has_one :one_time_payment
  belongs_to :user
  belongs_to :learning_path

  def current_lesson
    object.current_lesson
  end
end

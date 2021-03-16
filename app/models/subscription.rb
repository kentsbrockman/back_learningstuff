class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :learning_path
  has_one :one_time_payment
end

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :learning_path
end

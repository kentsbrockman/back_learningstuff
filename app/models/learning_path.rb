class LearningPath < ApplicationRecord
  validates :title, presence: true

  has_many :subscriptions
  has_and_belongs_to_many :courses, dependent: :destroy
  has_and_belongs_to_many :categories, dependent: :destroy
end

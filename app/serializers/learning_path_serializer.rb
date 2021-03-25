class LearningPathSerializer < ActiveModel::Serializer
  attributes :id, :title, :price_in_cents, :is_single_course, :description, :slug
  has_many :categories
  has_many :subscriptions
  has_many :courses

end

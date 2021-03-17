class LearningPathSerializer < ActiveModel::Serializer 
  attributes :id,:title, :price_in_cents
  has_many :categories
  has_many :subscriptions
  has_many :courses
end

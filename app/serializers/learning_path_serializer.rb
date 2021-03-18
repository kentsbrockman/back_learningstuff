

class LearningPathSerializer < ActiveModel::Serializer 
  attributes :id, :title, :price_in_cents, :is_single_course
  has_many :categories
  has_many :subscriptions
  has_many :courses


  def is_single_course

    return true if object.courses.length < 2
    return false
  end
end

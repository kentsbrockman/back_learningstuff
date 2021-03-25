class LearningPath < ApplicationRecord
  validates :title, presence: true

  after_create :add_slug
  has_many :subscriptions
  has_and_belongs_to_many :courses, dependent: :destroy
  has_and_belongs_to_many :categories, dependent: :destroy

  def is_single_course
    return true if self.courses.length < 2
    return false
  end

  def add_slug
    self.update(slug: self.title.gsub(/_/, '-').parameterize)
  end
end

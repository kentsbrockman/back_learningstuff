class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :learning_path
  has_one :one_time_payment
  has_many :courses, through: :learning_path
  has_many :progress_states, dependent: :destroy


  scope :with_course,
  ->(course_id)  { joins(:courses).where('courses.id = ?', course_id) }

end


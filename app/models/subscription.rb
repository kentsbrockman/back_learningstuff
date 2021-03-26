class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :learning_path
  has_one :one_time_payment
  has_many :courses, through: :learning_path
  after_create :send_subscription_confirmation_email

  scope :with_course,
        ->(course_id) { joins(:courses).where('courses.id = ?', course_id) }

  def send_subscription_confirmation_email
    UserMailer.subscription_confirmation_email(self).deliver_now
  end

  def current_lesson
    if self
         .learning_path
         .courses
         .first
         &.progress_states
         .find_by(user: self.user)
         &.progress_lessons
         &.empty?
      self.learning_path.courses.first.first_chapter&.first_lesson
    else
      self
        .learning_path
        .courses
        .first
        &.progress_states
        &.find_by(user: self.user)
        &.progress_lessons
        &.last
        &.lesson
        &.next_lesson
    end
  end
end

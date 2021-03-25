class ProgressState < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :progress_lessons, dependent: :destroy
  has_many :lessons, through: :progress_lessons

  def number_lessons_completed
    self.lessons.size
  end

  def progression
    if self.course.lessons.size.nonzero?
      self.number_lessons_completed * 100 / self.course.lessons.size * 100 / 100
    else
      100
    end
  end

end

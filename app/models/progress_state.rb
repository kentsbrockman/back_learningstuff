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

  def user_id
    self.user.id
  end

  def current_lesson
    if self.lessons.sort_by(&:position).last
      self.lessons.sort_by(&:position).last.next_lesson
    else
      self.course.first_chapter.first_lesson
    end
  end
end

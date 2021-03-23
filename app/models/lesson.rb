class Lesson < ApplicationRecord
  belongs_to :chapter
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :progress_lessons
  has_many :progress_states, through: :progress_lessons

  def next_lesson
    @ordered_lessons = self.chapter.lessons.sort_by(&:position)
    index = @ordered_lessons.index(self)
    @next_lesson = @ordered_lessons[index + 1]

    @next_lesson ? @next_lesson : self.chapter.next_chapter&.first_lesson
  end

  def previous_lesson
    @ordered_lessons = self.chapter.lessons.sort_by(&:position)
    index = @ordered_lessons.index(self)

    index === 0 ? self.chapter.previous_chapter&.last_lesson : @ordered_lessons[index - 1]
  end
end

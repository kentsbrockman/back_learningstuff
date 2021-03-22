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

    if @next_lesson
      return @next_lesson
    else
      return self.chapter.next_chapter&.first_lesson
    end

  end
end

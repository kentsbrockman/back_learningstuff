class Chapter < ApplicationRecord
  validates :title, presence: true
  belongs_to :course
  has_many :lessons, dependent: :destroy

  def first_lesson
    self.lessons.sort_by(&:position).first
  end

  def last_lesson
    self.lessons.sort_by(&:position).last
  end

  def next_chapter
    @ordered_chapters = self.course.chapters.sort_by(&:position)
    index = @ordered_chapters.index(self)
    return @ordered_chapters[index + 1]
  end

  def previous_chapter
    @ordered_chapters = self.course.chapters.sort_by(&:position)
    index = @ordered_chapters.index(self)
    index != 0 ? @ordered_chapters[index - 1] : nil
  end
end

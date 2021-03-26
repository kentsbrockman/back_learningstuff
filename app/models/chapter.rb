class Chapter < ApplicationRecord
  include GithubRepository

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

  def import_content(github_uri, chapter)
    self.title =
      get_content(github_uri, chapter.path + '/chapter_title.txt')
    self.position = chapter.name.split('_')[1]
    self.save!

    lessons_contents = client.contents(github_uri, path: chapter.path)
    lessons_contents&.each do |lesson|
      if lesson.name.start_with?('lesson')
        @lesson = self.lessons.new
        @lesson.import_content(github_uri, lesson)
      end
    end
  end
end

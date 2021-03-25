class Course < ApplicationRecord
  include GithubRepository

  validates :title, presence: true, uniqueness: true

  has_and_belongs_to_many :learning_paths, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :lessons, through: :chapters
  has_many :progress_states, dependent: :destroy

  def first_chapter
    self.chapters.sort_by(&:position).first
  end

<<<<<<< HEAD
  def number_lessons
    self.chapters.map{|chapter| chapter.lessons.size}.inject(0){|sum,x|sum + x}
=======
  def import_content(github_url)
    uri = get_repository_uri(github_url)
    self.update(title: get_content(uri, '/course_title.txt').squish)

    chapters_contents = client.contents(uri)
    chapters_contents&.each do |chapter|
      if chapter.name.start_with?('chapter')
        @chapter = self.chapters.new
        @chapter.import_content(uri, chapter)
      end
    end

    puts 'All done!'
>>>>>>> 953a200f99eac8a621af4817fcfacf826b28fdb6
  end
end

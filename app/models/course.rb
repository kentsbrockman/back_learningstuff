class Course < ApplicationRecord
  include GithubRepository

  validates :title, presence: true

  has_and_belongs_to_many :learning_paths, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :lessons, through: :chapters
  has_many :progress_states, dependent: :destroy

  def first_chapter
    self.chapters.sort_by(&:position).first
  end

  def import_course(github_url)
    uri = get_repository_uri(github_url)
    self.title = get_content(uri, "/course_title.txt").squish
    self.save
  end

  def import_chapters(github_url)
    uri = get_repository_uri(github_url)
    chapters_contents = client.contents(uri)

    chapters_contents&.each do |chapter|
      if chapter.name.start_with?("chapter")
        chapter_title = get_content(uri, chapter.path + "/chapter_title.txt").squish
        chapter_position = chapter.name.split("_")[1]
        @chapter = self.chapters.create(title: chapter_title, position: chapter_position)

        lessons_contents = client.contents(uri, path: chapter.path)
        lessons_contents&.each do |lesson|
          if lesson.name.start_with?("lesson")
            lesson_title = get_content(uri, lesson.path + "/lesson_title.txt")&.squish
            lesson_content = get_content(uri, lesson.path + "/lesson_content.txt")&.squish
            lesson_video = get_content(uri, lesson.path + "/lesson_video.txt")&.squish
            lesson_position = lesson.name.split("_")[1]
            @lesson = @chapter.lessons.create(title: lesson_title, video_url: lesson_video, content: lesson_content, position: lesson_position)
            lesson_quizz = get_content_json(uri, lesson.path + "/lesson_quizz.json")
            lesson_quizz["questions"]&.each do |question|
              @new_question = @lesson.questions.create(content: question["content"])
              question["answers"]&.each do |answer|
                @new_question.answers.create(content: answer["content"], is_correct: answer["is_correct"])
              end
            end
          end
        end
      end
    end



  end
end

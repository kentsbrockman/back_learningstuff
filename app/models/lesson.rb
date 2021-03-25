class Lesson < ApplicationRecord
  include GithubRepository

  validates :title, presence: true, uniqueness: true
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

    if index === 0
      self.chapter.previous_chapter&.last_lesson
    else
      @ordered_lessons[index - 1]
    end
  end

  def import_content(github_uri, lesson)
    self.title =
      get_content(github_uri, lesson.path + '/lesson_title.txt')&.squish
    self.content =
      get_content(github_uri, lesson.path + '/lesson_content.txt')&.squish
    self.video_url =
      get_content(github_uri, lesson.path + '/lesson_video.txt')&.squish
    self.position = lesson.name.split('_')[1]
    self.save

    lesson_quizz =
      get_content_json(github_uri, lesson.path + '/lesson_quizz.json')
    if lesson_quizz
      lesson_quizz['questions']&.each do |question|
        @new_question =
          self.questions.create(
            content: question['content'],
            explanation: question['explanation']
          )
        question['answers']&.each do |answer|
          @new_question.answers.create(
            content: answer['content'],
            is_correct: answer['is_correct']
          )
        end
      end
    end
  end
end

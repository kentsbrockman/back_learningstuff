class LessonSerializer < ActiveModel::Serializer
  attributes :id,
             :position,
             :title,
             :content,
             :video_url,
             :next_lesson,
             :previous_lesson,
             :allowed
  belongs_to :chapter
  has_many :questions
  has_many :comments
  has_many :progress_states

  def allowed
    course = object.chapter.course
    is_current_lesson = course.first_chapter.first_lesson == object
    current_user &&
      (
        is_current_lesson ||
          current_user.read_lessons.include?(object.previous_lesson)
      )
  end
end

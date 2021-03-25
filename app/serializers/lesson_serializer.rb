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
    !current_user.read_lessons.include?(object.previous_lesson)
    course = object.chapter.course
    learning_paths_ids = course&.learning_paths&.map{|a| a.id}
    is_current_lesson = current_user&.subscriptions&.filter{|a| learning_paths_ids&.include?(a&.learning_path_id)}&.first&.current_lesson == object
    current_user &&  (is_current_lesson || current_user&.progress_states&.find_by(course:course)&.progress_lessons&.filter{|a| a&.lesson == object}&.any?)
  end
end

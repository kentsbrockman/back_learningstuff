class LessonSerializer < ActiveModel::Serializer
  attributes :id, :position, :title, :content, :video_url, :next_lesson
  belongs_to :chapter
  has_many :questions
  has_many :comments
  has_many :progress_states

  # def next_lesson
  #   @ordered_lessons = self.chapter.lessons.sort_by(&:position)
  #   index = @ordered_lessons.index(self)
  #   @next_lesson = @ordered_lessons[index + 1]

  #   if @next_lesson
  #     return @next_lesson
  #   else

  #   end
  # end
end

class LessonSerializer < ActiveModel::Serializer
  attributes :id,
             :position,
             :title,
             :content,
             :video_url,
             :next_lesson,
             :previous_lesson
  belongs_to :chapter
  has_many :questions
  has_many :comments
  has_many :progress_states
end

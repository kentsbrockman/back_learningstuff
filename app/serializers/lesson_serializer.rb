class LessonSerializer
  include JSONAPI::Serializer
  attributes :position, :title
  belongs_to :chapter
  has_one :lesson_content
  has_one :lesson_video
  has_many :questions
  has_many :comments
  has_many :progress_states
end

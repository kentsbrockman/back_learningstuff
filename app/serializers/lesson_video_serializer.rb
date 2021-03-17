class LessonVideoSerializer
  include JSONAPI::Serializer
  attributes :url
  belongs_to :lesson
end

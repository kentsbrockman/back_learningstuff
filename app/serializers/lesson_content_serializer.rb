class LessonContentSerializer
  include JSONAPI::Serializer
  attributes :text
  belongs_to :lesson
end

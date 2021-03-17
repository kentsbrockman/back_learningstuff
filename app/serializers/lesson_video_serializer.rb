class LessonVideoSerializer < ActiveModel::Serializer 
  attributes :id, :url
  belongs_to :lesson
end

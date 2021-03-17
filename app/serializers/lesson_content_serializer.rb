class LessonContentSerializer < ActiveModel::Serializer 
  attributes :id, :text
  belongs_to :lesson
end

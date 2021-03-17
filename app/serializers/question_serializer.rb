class QuestionSerializer < ActiveModel::Serializer 
  attributes :id, :position, :content
  belongs_to :lesson
  has_many :answers
end

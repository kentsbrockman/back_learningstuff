class QuestionSerializer
  include JSONAPI::Serializer
  attributes :position, :content
  belongs_to :lesson
  has_many :answers
end

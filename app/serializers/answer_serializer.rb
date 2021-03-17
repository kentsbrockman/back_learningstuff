class AnswerSerializer
  include JSONAPI::Serializer
  attributes :content, :is_correct, :explanation
  belongs_to :questions
end

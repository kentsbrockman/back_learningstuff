class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :is_correct
  belongs_to :questions
end

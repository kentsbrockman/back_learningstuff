class AnswerSerializer < ActiveModel::Serializer 
  attributes :id, :content, :is_correct, :explanation
  belongs_to :questions
end

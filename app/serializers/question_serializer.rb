class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :position, :content, :is_multiple, :explanation
  belongs_to :lesson
  has_many :answers

  def is_multiple
    return true if object.answers.correct.size > 1
    return false
  end
end

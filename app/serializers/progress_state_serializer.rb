class ProgressStateSerializer < ActiveModel::Serializer
  attributes :id, :course_id, :progression, :number_lessons_completed, :user_id
  belongs_to :course
  belongs_to :user
  has_many :lessons

  def progression
    object.progression
  end

  def number_lessons_completed
    object.number_lessons_completed
  end

  def user_id
    object.user.id
  end
end

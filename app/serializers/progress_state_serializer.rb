class ProgressStateSerializer < ActiveModel::Serializer
  attributes :id, :course_id, :progression, :number_lessons_completed, :user_id
  belongs_to :course
  belongs_to :user
  has_many :lessons
end

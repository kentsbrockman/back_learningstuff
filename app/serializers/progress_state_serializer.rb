class ProgressStateSerializer < ActiveModel::Serializer
  attributes :id, :course_id
  belongs_to :course
  belongs_to :user
  has_many :lessons
end

class ProgressStateSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :course
  belongs_to :user
  has_many :lessons
end

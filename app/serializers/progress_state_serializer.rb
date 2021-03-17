class ProgressStateSerializer < ActiveModel::Serializer 
  attributes :id 
  belongs_to :course
  belongs_to :subscription
  has_many :lessons
end

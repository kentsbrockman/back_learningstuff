class ProgressStateSerializer
  include JSONAPI::Serializer
  attributes 
  belongs_to :course
  belongs_to :subscription
  has_many :lessons
end

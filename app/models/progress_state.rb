class ProgressState < ApplicationRecord
  belongs_to :course
  belongs_to :subscription
  has_and_belongs_to_many :lessons
end

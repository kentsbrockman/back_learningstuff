class ProgressState < ApplicationRecord
  belongs_to :course
  belongs_to :subscription
  has_one :user, through: :subscription
  has_many :progress_lessons
  has_many :lessons, through: :progress_lessons
end

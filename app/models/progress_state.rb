class ProgressState < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :progress_lessons, dependent: :destroy
  has_many :lessons, through: :progress_lessons
end

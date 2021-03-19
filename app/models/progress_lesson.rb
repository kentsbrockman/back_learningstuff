class ProgressLesson < ApplicationRecord
  belongs_to :progress_state
  belongs_to :lesson
  has_one :user, through: :progress_state
end

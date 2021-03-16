class LessonContent < ApplicationRecord
  validates :text, presence: true
  belongs_to :lesson
end

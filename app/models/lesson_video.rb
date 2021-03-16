class LessonVideo < ApplicationRecord
  validates :url, presence: true
  belongs_to :lesson
end

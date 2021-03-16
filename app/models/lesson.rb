class Lesson < ApplicationRecord
  belongs_to :chapter
  has_one :lesson_content
  has_one :lesson_video
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
end

class Lesson < ApplicationRecord
  belongs_to :chapter
  has_one :lesson_content, dependent: :destroy
  has_one :lesson_video, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
end

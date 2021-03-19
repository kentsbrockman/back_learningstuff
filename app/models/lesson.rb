class Lesson < ApplicationRecord
  belongs_to :chapter
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :progress_lessons
  has_many :progress_states, through: :progress_lessons

end

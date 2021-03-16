class Question < ApplicationRecord
  validates :content, presence: true
  belongs_to :lesson
  has_many :answers
end

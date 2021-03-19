class Answer < ApplicationRecord
  validates :content, presence: true
  belongs_to :question

  scope :correct, -> { where(is_correct: true) }
end

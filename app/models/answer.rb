class Answer < ApplicationRecord
  validates :content, presence: true
  belongs_to :question
end

class Chapter < ApplicationRecord
  validates :title, presence: true
  belongs_to :course
  has_many :lessons
end

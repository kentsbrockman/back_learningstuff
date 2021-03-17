class Course < ApplicationRecord
  validates :title, presence: true

  has_and_belongs_to_many :learning_paths, dependent: :destroy
  has_many :chapters
  has_many :progress_states, dependent: :destroy
end

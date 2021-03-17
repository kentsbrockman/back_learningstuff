class Category < ApplicationRecord
  validates :title, presence: true

  has_and_belongs_to_many :learning_paths, dependent: :destroy
end

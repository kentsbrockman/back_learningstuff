class Comment < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  has_many :reply_comments, dependent: :destroy
end

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :created_at
  belongs_to :user
  belongs_to :lesson
  has_many :reply_comments
end

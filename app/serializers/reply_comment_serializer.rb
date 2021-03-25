class ReplyCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :comment
  belongs_to :user
end

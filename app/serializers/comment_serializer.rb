class CommentSerializer < ActiveModel::Serializer 
  attributes :id, :content, :user_id
  belongs_to :user
  belongs_to :lesson
end

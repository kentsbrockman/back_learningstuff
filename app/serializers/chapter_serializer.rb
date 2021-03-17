class ChapterSerializer < ActiveModel::Serializer 
  attributes :id,:position, :title
  belongs_to :course
  has_many :lessons
end

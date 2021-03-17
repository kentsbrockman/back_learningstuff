class ChapterSerializer
  include JSONAPI::Serializer
  attributes :position, :title
  belongs_to :course
  has_many :lessons
end

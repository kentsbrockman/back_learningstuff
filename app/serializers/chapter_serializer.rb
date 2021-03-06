class ChapterSerializer < ActiveModel::Serializer
  attributes :id,
             :position,
             :title,
             :first_lesson,
             :next_chapter,
             :previous_chapter,
             :course_id
  belongs_to :course
  has_many :lessons
end

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :first_chapter, :number_lessons
  has_many :learning_paths
  has_many :progress_states
  has_many :chapters

  def number_lessons
    object.lessons.size
  end
end

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :first_chapter
  has_many :learning_paths
  has_many :progress_states
  has_many :chapters
end

class CourseSerializer
  include JSONAPI::Serializer
  attributes :title
  has_many :learning_paths
  has_many :progress_states
  has_many :chapters
end

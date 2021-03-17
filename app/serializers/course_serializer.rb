class CourseSerializer < ActiveModel::Serializer 
  attributes :id, :title
  has_many :learning_paths
  has_many :progress_states
  has_many :chapters
end

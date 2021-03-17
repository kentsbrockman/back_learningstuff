class CategorySerializer
  include JSONAPI::Serializer
  attributes :title
  has_many :learning_paths
end

class CategorySerializer < ActiveModel::Serializer 
  attributes :id,:title
  has_many :learning_paths
end

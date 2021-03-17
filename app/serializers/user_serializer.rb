class UserSerializer < ActiveModel::Serializer 
  attributes :id,:email, :first_name, :last_name, :is_approved, :is_reviewed, :role, :description, :linkedin_address, :job, :customer_stripe_id
  has_many :comments
  has_many :subscriptions
end

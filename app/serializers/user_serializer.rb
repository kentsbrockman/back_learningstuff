class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email,
             :first_name,
             :last_name,
             :is_approved,
             :is_reviewed,
             :role,
             :description,
             :linkedin_address,
             :job,
             :customer_stripe_id,
             :avatar
  has_many :comments
  has_many :subscriptions
  has_many :progress_states

  def avatar
    rails_blob_url(object.avatar, disposition: "attachment", only_path: true) if object.avatar.attached?
  end
end

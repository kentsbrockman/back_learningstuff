class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id,
             :email,
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
  has_many :progress_lessons
  has_many :read_lessons
  has_many :reply_comments

  def avatar
    if object.avatar.attached?
      if Rails.env.production?
        object.avatar&.service_url&.split('?')&.first
      else
        'http://localhost:8080' + rails_blob_path(object.avatar)
      end
    end
  end
end

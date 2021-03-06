class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :recoverable, :rememberable, :validatable and :omniauthable

  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         :recoverable,
         jwt_revocation_strategy: self

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  after_create :send_welcome_email
  after_update :send_email_approval

  has_many :subscriptions, dependent: :destroy
  has_many :courses, through: :subscriptions
  has_many :progress_states, dependent: :destroy
  has_many :progress_lessons, through: :progress_states
  has_many :read_lessons, through: :progress_lessons, source: :lesson
  has_many :learning_paths, through: :subscriptions
  has_and_belongs_to_many :categories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :reply_comments, dependent: :destroy

  enum role: { student: 'student', admin: 'admin', teacher: 'teacher' }

  scope :to_review, -> { where(is_reviewed: false) }
  scope :approved, -> { where(is_approved: true) }
  scope :students, -> { where(role: 'student') }
  scope :teachers, -> { where(role: 'teacher') }
  scope :admins, -> { where(role: 'admin') }

  def subscribe(learning_path, customer_stripe_id, total_amount)
    subscription = self.subscriptions.create(learning_path: learning_path)
    stored_payment =
      OneTimePayment.create(
        subscription: subscription,
        total_amount: total_amount
      )
    subscription
      .learning_path
      .courses
      .each { |course| self.progress_states.create(course: course) }
    if self.customer_stripe_id.nil?
      self.update!(customer_stripe_id: customer_stripe_id)
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def send_email_approval
    if saved_change_to_attribute?(:is_reviewed) && self.is_approved
      UserMailer.email_approval(self).deliver_now
    end
  end
end

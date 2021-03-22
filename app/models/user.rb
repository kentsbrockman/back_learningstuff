class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :recoverable, :rememberable, :validatable and :omniauthable

  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  has_many :subscriptions, dependent: :destroy
  has_many :courses, through: :subscriptions
  has_many :progress_states, dependent: :destroy
  has_many :progress_lessons, through: :progress_states
  has_many :learning_paths, through: :subscriptions

  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  enum role: { student: 'student', admin: 'admin', teacher: 'teacher' }

  scope :to_review, -> { where(is_reviewed: false) }
  scope :approved, -> { where(is_approved: true) }
  scope :students, -> { where(role: 'student') }
  scope :teachers, -> { where(role: 'teacher') }
  scope :admins, -> { where(role: 'admin') }

  after_create :send_welcome_email
  after_update :send_email_approval

  def subscribe(learning_path)
    @subscription = Subscriptions.new(user_id: current_user.id, learning_path_id: learning_path.id)
    if @subscription.save
      @subscription.courses.each do |course|
        ProgressState.create(subscription_id: @subscription.id, course_id: course.id)
      end
      current_user.send_subscription_approval
    end
    # else
    #   handle errors
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def send_email_approval
    UserMailer.email_approval(self).deliver_now
  end

end

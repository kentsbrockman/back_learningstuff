class UserMailer < ApplicationMailer
  default from: 'admin-learningstuff@yopmail.com'

  @url = ENV['HOME_URL']

  def welcome_email(user)
    @user = user
    mail(
      from: 'admin-learningstuff@yopmail.com',
      to: @user.email,
      subject: 'welcome email'
    )
  end

  def email_approval(user)
    @user = user
    mail(
      from: 'admin-learningstuff@yopmail.com',
      to: @user.email,
      subject: 'your account has been approved'
    )
  end

  def subscription_confirmation_email(subscription)
    @user = User.find(subscription.user_id)
    @subscription = subscription
    @courses = subscription.learning_path.courses
    mail(
      from: 'admin-learningstuff@yopmail.com',
      to: @user.email,
      subject:
        'You subscribed for the ' + @subscription.learning_path.title +
          ' learning path '
    )
  end
end

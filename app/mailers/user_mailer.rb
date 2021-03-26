class UserMailer < ApplicationMailer
  default from: 'admin-learningstuff@yopmail.com'

  @url = ENV['HOME_URL']

  def welcome_email(user)
    @user = user
    mail(
      from: 'admin-learningstuff@yopmail.com',
      to: @user.email,
      subject: t(:welcome_email_subject)
    )
  end

  def email_approval(user)
    @user = user
    mail(
      from: 'admin-learningstuff@yopmail.com',
      to: @user.email,
      subject: t(:account_approved_subject)
    )
  end

  def subscription_confirmation_email(subscription)
    @user = subscription.user
    @subscription = subscription
    @courses = subscription.learning_path.courses
    mail(
      from: 'admin-learningstuff@yopmail.com',
      to: @user.email,
      subject:
        t(:your_subscription_for) + " '" + @subscription.learning_path.title +
          "' " + t(:was_confirmed) + ' !'
    )
  end
end

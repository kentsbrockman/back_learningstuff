class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '400'
        }
      ]
    },
    status: :bad_request
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |user| user.permit(:email, :password, :password_confirmation, :current_password)}
  end
end

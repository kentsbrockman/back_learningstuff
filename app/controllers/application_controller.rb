class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_user_is_subscribed
    @course = Course.find(params[:course_id]) if params[:course_id]
    unless current_user.courses && current_user.courses.include?(@course)
      render json: {success: false, error: "You are not allowed to see this page"}, status: 401
    end
  end

  def get_course
    @course = Course.find(params[:course_id]) if params[:course_id]
  end

  def get_chapter
    @chapter = Chapter.find(params[:chapter_id]) if params[:chapter_id]
  end

  def get_lesson
    @lesson = Lesson.find(params[:lesson_id]) if params[:lesson_id]
  end

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
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:email, :password, :password_confirmation, :current_password)
    end
  end
end

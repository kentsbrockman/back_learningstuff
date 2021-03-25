class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_user_is_subscribed
    @course = Course.find(params[:course_id]) if params[:course_id]
    unless current_user.courses && current_user.courses.include?(@course)
      render json: {
               success: false,
               error: 'You are not allowed to see this page'
             },
             status: 401
    end
  end
  
  def check_user_lesson_completed
    @lesson = Lesson.find(params[:id]) if params[:id]
    @course = Course.find(params[:course_id]) if params[:course_id]
    @progress_lessons = current_user.progress_states.find_by(course:@course).progress_lessons
    @current_lesson = @progress_lessons.last.lesson.next_lesson
    if @progress_lessons.filter{|a| a.lesson == @lesson}.empty? && @current_lesson != @lesson
      render json: {
        success: false,
        error: 'You cannot access this lesson please finish the previous one'
      },
      status: 401
    end
  end


  def get_course
    @course = Course.find(params[:course_id]) if params[:course_id]
    @course = Course.find(params[:id]) if params[:id]
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

  def authenticate_admin
    unless current_user.role === 'admin' && current_user.is_approved
      render json: {
               success: false,
               error: 'You are not allowed to see this page'
             },
             status: 401
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

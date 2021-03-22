class ProgressLessonsController < ApplicationController
  before_action :get_course
  before_action :get_lesson
  before_action :authenticate_user!
  before_action :check_user_is_subscribed

  def create
    @progress_states = current_user.progress_states.where(course: @course)

    @progress_states.each do |progress_state|
      @progress_lesson = progress_state.progress_lessons.find_by(lesson: @lesson)
      if @progress_lesson
        @progress_lesson.update(quizz_result: params[:quizz_result])
      else
        @progress_lesson = progress_state.progress_lessons.create(lesson: @lesson, quizz_result: params[:quizz_result])
      end
    end

    if @progress_lesson
      render json: @progress_lesson, status: :created
    else
      render json: @progress_lesson.erros.full_messages, status: :unprocessable_entity
    end


  end

  private

  def progress_state_params
    params.require(:lesson_progress_state).permit(:quizz_result)
  end

end

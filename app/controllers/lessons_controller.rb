class LessonsController < ApplicationController
  before_action :get_course
  before_action :get_chapter
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :set_lesson, only: %i[show]

  # GET /lessons
  def index
    @lessons = @chapter.lessons

    render json: @lessons
  end

  # GET /lessons/1
  def show
    render json: @lesson, include:['*', 'questions.answers', 'comments.user']
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end

class LessonsController < ApplicationController
  before_action :get_course
  before_action :get_chapter
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :check_user_lesson_completed, only: [:show]
  before_action :set_lesson, only: %i[show]
  before_action :check_correct_course
  before_action :check_correct_chapter, only: [:show]

  # GET /lessons
  def index
    if @course.chapters.include?(@chapter)
      @lessons = @chapter.lessons.sort_by(&:position)
      render json: @lessons
    else
      render json: { errors: 'No content' }, status: :bad_request
    end
  end

  # GET /lessons/1
  def show
    render json: @lesson, include: %w[* questions.answers]
  end

  private

  def check_correct_course
    unless @course.chapters.include?(@chapter)
      render json: {
               success: false,
               error: "This chapter doesn't match this course"
             },
             status: :bad_request
    end
  end

  def check_correct_chapter
    unless @chapter.lessons.include?(@lesson)
      render json: {
               success: false,
               error: "This lesson doesn't match this chapter"
             },
             status: :bad_request
    end
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end

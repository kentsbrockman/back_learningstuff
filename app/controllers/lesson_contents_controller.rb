class LessonContentsController < ApplicationController
  before_action :get_course
  before_action :get_chapter
  before_action :get_lesson
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :set_lesson_content, only: %i[show]

  # GET /lesson_contents
  def index
    @lesson_contents = LessonContent.all

    render json: LessonContentSerializer.new(@lesson_contents).serializable_hash.to_json
  end

  # GET /lesson_contents/1
  def show
    render json: LessonContentSerializer.new(@lesson_content).serializable_hash.to_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_content
    @lesson_content = LessonContent.find(params[:id])
  end

end

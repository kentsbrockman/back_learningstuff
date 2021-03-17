class QuestionsController < ApplicationController
  before_action :get_course
  before_action :get_chapter
  before_action :get_lesson
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :set_question, only: %i[show]

  # GET /questions
  def index
    @questions = Question.all

    render json: QuestionSerializer.new(@questions).serializable_hash.to_json
  end

  # GET /questions/1
  def show
    render json: QuestionSerializer.new(@question).serializable_hash.to_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

end

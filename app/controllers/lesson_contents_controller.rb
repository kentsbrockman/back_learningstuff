class LessonContentsController < ApplicationController
  before_action :set_lesson_content, only: %i[show update destroy]

  # GET /lesson_contents
  def index
    @lesson_contents = LessonContent.all

    render json: @lesson_contents
  end

  # GET /lesson_contents/1
  def show
    render json: @lesson_content
  end

  # POST /lesson_contents
  def create
    @lesson_content = LessonContent.new(lesson_content_params)

    if @lesson_content.save
      render json: @lesson_content, status: :created, location: @lesson_content
    else
      render json: @lesson_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lesson_contents/1
  def update
    if @lesson_content.update(lesson_content_params)
      render json: @lesson_content
    else
      render json: @lesson_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lesson_contents/1
  def destroy
    @lesson_content.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_content
    @lesson_content = LessonContent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_content_params
    params.require(:lesson_content).permit(:text, :lesson_id)
  end
end

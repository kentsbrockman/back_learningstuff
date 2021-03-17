class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show update destroy]

  # GET /lessons
  def index
    @lessons = Lesson.all

    render json: LessonSerializer.new(@lessons).serializable_hash.to_json
  end

  # GET /lessons/1
  def show
    render json: LessonSerializer.new(@lesson).serializable_hash.to_json
  end

  # POST /lessons
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      render json: @lesson, status: :created, location: @lesson
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lessons/1
  def update
    if @lesson.update(lesson_params)
      render json: @lesson
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:chapter_id, :position, :title)
  end
end

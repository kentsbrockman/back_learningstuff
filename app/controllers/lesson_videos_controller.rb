class LessonVideosController < ApplicationController
  before_action :set_lesson_video, only: %i[show update destroy]

  # GET /lesson_videos
  def index
    @lesson_videos = LessonVideo.all

    render json: @lesson_videos
  end

  # GET /lesson_videos/1
  def show
    render json: @lesson_video
  end

  # POST /lesson_videos
  def create
    @lesson_video = LessonVideo.new(lesson_video_params)

    if @lesson_video.save
      render json: @lesson_video, status: :created, location: @lesson_video
    else
      render json: @lesson_video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lesson_videos/1
  def update
    if @lesson_video.update(lesson_video_params)
      render json: @lesson_video
    else
      render json: @lesson_video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lesson_videos/1
  def destroy
    @lesson_video.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_video
    @lesson_video = LessonVideo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_video_params
    params.require(:lesson_video).permit(:url, :lesson_id)
  end
end

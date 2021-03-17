class LessonVideosController < ApplicationController
  before_action :get_course
  before_action :get_chapter
  before_action :get_lesson
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :set_lesson_video, only: %i[show]

  # GET /lesson_videos/1
  def show
    render json: @lesson.lesson_video
  end

end

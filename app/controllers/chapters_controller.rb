class ChaptersController < ApplicationController
  before_action :get_course
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :set_chapter, only: %i[show]

  # GET /chapters
  def index
    @chapters = @course.chapters

    render json: ChapterSerializer.new(@chapters).serializable_hash.to_json
  end

  # GET /chapters/1
  def show
    render json: ChapterSerializer.new(@chapter).serializable_hash.to_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

end

class Admin::CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  def index
    @courses = Course.all.order('created_at DESC')

    render json: @courses
  end

  def create
    @course = Course.new
    @course.import_content(params[:github_url])

    if @course.chapters
      render json: @course, status: :created, location: @category
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:github_url)
  end
end

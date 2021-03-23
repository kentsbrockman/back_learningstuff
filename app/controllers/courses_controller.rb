class CoursesController < ApplicationController
  before_action :get_course, only: %i[show update destroy]

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course
  end
end

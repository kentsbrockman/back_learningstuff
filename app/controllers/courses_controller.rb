class CoursesController < ApplicationController
  before_action :get_course, only: %i[show update destroy]

  # GET /courses
  def index
    @courses = Course.all

    render json: CourseSerializer.new(@courses).serializable_hash.to_json
  end

  # GET /courses/1
  def show
    render json: CourseSerializer.new(@course).serializable_hash.to_json
  end

end

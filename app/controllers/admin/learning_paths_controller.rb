class Admin::LearningPathsController < ApplicationController
  before_action :set_learning_path, only: %i[show update destroy]

  # GET /learning_paths
  def index
    @learning_paths = LearningPath.all

    render json: @learning_paths
  end

  # GET /learning_paths/1
  def show
    render json: @learning_path
  end

  # POST /learning_paths
  def create
    @learning_path = LearningPath.new(learning_path_params)

    if @learning_path.save
      render json: @learning_path, status: :created, location: @learning_path
    else
      render json: @learning_path.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /learning_paths/1
  def update
    puts "DEBUT EDIT"
    if params[:deleted_course_id]
      @learning_path.courses.where(id: params[:deleted_course_id]).destroy_all
      render json: @learning_path
    elsif params[:added_course_id]
      puts "IL Y A UN COURS A AJOUTER"
      @course =  Course.find(params[:added_course_id])
      puts "/////"
      puts @course
      @learning_path.courses << @course

      render json: @learning_path
    else
      puts "RIEN TROVUE"
    end

  end

  # DELETE /learning_paths/1
  def destroy
    @learning_path.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_learning_path
    @learning_path = LearningPath.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def learning_path_params
    params.require(:learning_path).permit(:title, :price_in_cents, :deleted_course_id, :added_course_id)
  end
end

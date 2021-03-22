class LearningPathsController < ApplicationController
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_learning_path
    @learning_path = LearningPath.find(params[:id])
  end

end

class LearningPathsController < ApplicationController
  before_action :set_learning_path, only: %i[show update destroy]

  # GET /learning_paths
  def index
    if params[:single] === 'true'
      @learning_paths =
        LearningPath.all.select { |path| path.courses.length === 1 }
    elsif params[:single] === 'false'
      @learning_paths =
        LearningPath.all.select { |path| path.courses.length > 1 }
    else
      @learning_paths = LearningPath.all
    end
    if params[:categories]
      categories_ids = params[:categories].split(',')
      @learning_paths =
        @learning_paths.filter do |path|
          categories_ids.all? do |catId|
            path.categories.any? { |id| id.id == catId.to_i }
          end
        end
    end
    render json: @learning_paths
  end

  # GET /learning_paths/1
  def show
    render json: @learning_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_learning_path
    @learning_path = LearningPath.find_by!(slug: params[:id])
  end
end

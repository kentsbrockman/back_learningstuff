class ProgressStatesController < ApplicationController
  before_action :set_progress_state, only: %i[show update destroy]

  # GET /progress_states
  def index
    @progress_states = ProgressState.all

    render json: @progress_states
  end

  # GET /progress_states/1
  def show
    render json: @progress_state
  end

  # POST /progress_states
  def create
    @progress_state = ProgressState.new(progress_state_params)

    if @progress_state.save
      render json: @progress_state, status: :created, location: @progress_state
    else
      render json: @progress_state.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_progress_state
    @progress_state = ProgressState.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def progress_state_params
    params.require(:progress_state).permit(:course_id, :subscription_id)
  end
end

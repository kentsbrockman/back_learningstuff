class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user, include:['*', 'courses.progress_state.lessons']
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: current_user.errors.full_messages,
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :description, :linkedin_address, :job)
  end
end

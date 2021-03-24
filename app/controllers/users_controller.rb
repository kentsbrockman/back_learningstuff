gem 'pry'

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user, include:['*', 'courses.progress_state.lessons']
  end

  def update
   
    if current_user.update(user_params)
      if params[:category_ids]
        current_user.update(category_ids:"")
        params[:category_ids].each do |category_id|
        current_user.categories << Category.find(category_id)
        end
      end
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

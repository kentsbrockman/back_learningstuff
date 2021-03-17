class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user
  end

  def profile
    render json: current_user
  end
end

class Admin::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[ destroy]

  # POST /subscriptions
  def create
    @subscription = Subscription.new(
      learning_path_id: params[:learning_path_id], 
      user_id: params[:user_id]
    )
    if @subscription.save
     @subscription.learning_path.courses.map{|course| ProgressState.find_or_create_by(user_id: params[:user_id], course: course)}
      render json: @subscription, status: :created
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.learning_path.courses.map{|course| course.progress_states.where(user_id: @subscription.user_id, course: course).destroy_all}
    @subscription.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_params
    params.require(:subscription).permit(:learning_path, :user)
  end
end

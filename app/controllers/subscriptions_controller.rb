class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /subscriptions
  def index
    @subscriptions = current_user.subscriptions

    render json: @subscriptions
  end

  # GET /subscriptions/1
  def show
    render json: @subscription
  end

  # POST /subscriptions
  def create
    if current_user.learning_paths.include?(
         LearningPath.find(params[:learning_path_id])
       )
      render json: { errors: 'Already Subscribed' }, status: :bad_request
    else
      @subscription = current_user.subscriptions.new(subscription_params)
      if @subscription.save
        render json: @subscription, status: :created
      else
        render json: @subscription.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_params
    params.require(:subscription).permit(:user_id, :learning_path_id)
  end
end

class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    if @user.avatar.attached?
      render json: @user.avatar
    else
      render json: { errors: t(:no_avatar_attached) }, status: 400
    end
  end
end

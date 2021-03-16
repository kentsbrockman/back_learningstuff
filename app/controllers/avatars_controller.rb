class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
  end
end

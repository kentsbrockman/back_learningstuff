class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])

    if @user.avatar.attached?
      avatar_serializer = AvatarSerializer.new(avatar: @user.avatar, user: @user)
      render json: avatar_serializer.serialize_new_avatar
    else
      render json: {errors: "No profile picture attached"}, status: 400
    end
  end
end

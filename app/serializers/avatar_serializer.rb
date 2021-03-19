class AvatarSerializer < ActiveModel::Serializer 
  def initialize(avatar: nil, user:)
    @avatar = avatar
    @user = user
  end

  def serialize_new_avatar
    serialized_new_avatar = serialize_avatar(@avatar, @user)
    serialized_new_avatar.to_json()
  end

  private

  def serialize_avatar(avatar, user)
    {
      avatar: {
        user_id: user.id,
        image_url: user.get_avatar_url(),
        created_at: avatar.created_at,
      }
    }
  end
end

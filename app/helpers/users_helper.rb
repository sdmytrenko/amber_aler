module UsersHelper
  def avatar_for(user, options = { size: 80})
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size
    else
      image_tag "default_avatar.jpg", width: size
    end
  end
end

# image_tag @user.avatar.url(:thumb) if @user.avatar?
# image_tag @user.avatar
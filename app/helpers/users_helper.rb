module UsersHelper
  def avatar_for(user, options = { size: 80})
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url(:logo), width: size, class: 'avatar-image'
    else
      image_tag "default_avatar.jpg", width: size, class: 'avatar-image'
    end
  end

  # def online(user)
  #   user.last_seen > 10.minutes.ago
  # end

  def online_status(user)
    if user.last_seen > 10.minutes.ago 
      content_tag :div, "ONLINE", class: 'label label-success'
    else
      content_tag :div, "OFFLINE", class: 'label label-default'
    end
  end

end
# image_tag @user.avatar.url(:thumb) if @user.avatar?
# image_tag @user.avatar
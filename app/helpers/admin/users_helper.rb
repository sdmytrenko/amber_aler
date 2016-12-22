module Admin::UsersHelper
  def activity_button_title user
    user.active ? 'Deactivete' : 'Activate'
  end
end

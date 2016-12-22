class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!

  # if current user is not admin, redirect to home page
  def authorize_user!
    redirect_to root_path unless current_user.admin?
  end
end

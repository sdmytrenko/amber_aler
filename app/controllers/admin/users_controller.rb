class Admin::UsersController < ApplicationController

  before_action :load_user, only: [:edit, :update, :destroy, :toggle_active]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update permitted_params
      redirect_to [:admin, :users]
    else
      render 'edit'
    end
  end

  def toggle_active
    @user.toggle! :active # метод в ActiveRecord міняє значення на протилежне
    redirect_to [:admin, :users]
  end

  def destroy
    @user.destroy!
    redirect_to [:admin, :users]
  end

  protected

  def load_user
    @user = User.find params[:id]
  end

  def permitted_params
    params.require(:user).permit(:name, :email, :role)
  end


end

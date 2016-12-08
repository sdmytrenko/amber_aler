class EmergenciesController < ApplicationController

  before_action :find_emergency, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :only_author!, only: [:edit, :update, :destroy]

  def new
    @emergency = Emergency.new
  end

  def create
    @emergency = Emergency.new(page_params)
    @emergency.user = current_user # додавання id поточного юзера
    if @emergency.save
      redirect_to emergencies_path
    else
      render :new
    end
  end

  def index
    @emergencies = Emergency.not_archived.order(updated_at: :desc).page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @emergency.update(page_params)
      redirect_to emergency_path, flash: {notice: 'Post successfuly updated'}
    else
      render :edit
    end
  end

  def show
    @message = Message.new(emergency: @emergency) # Для того, щоб у в’юсі були меседжі simple_form_for([@emergency, @message])
    @messages = @emergency.messages.page(params[:page]).per(5)
  end

  def destroy
    if @emergency.destroy
      redirect_to emergencies_path
    else
      redirect_to emergencies_path, flash: {error: 'Something goes wrong'}
    end
  end

  private
    def only_author!
      unless @emergency.user == current_user
        redirect_to emergencies_path, flash: {error: 'Only author can update emergency'}
      end
    end

    def page_params
      params.require(:emergency).permit(:title, :description)
    end

    def find_emergency
      @emergency = Emergency.find(params[:id])
    end

end

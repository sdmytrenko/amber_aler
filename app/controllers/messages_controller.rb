class MessagesController < ApplicationController

  before_action :find_emergency, only: [:edit, :update, :destroy]
  before_action :find_message, only: [:edit, :update, :destroy]
  # before_action :only_author!, only: [:edit, :update, :destroy]

  def new
    @message = Message.new
  end

  def create
    @emergency  = Emergency.find(params[:id])
    @message = @emergency.messages.new(messages_params)
    @message.user = current_user
    if @message.save
      redirect_to emergency_path(@emergency)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @message.update
      redirect to emergency_path(@emergency), flash: {notice: 'Post successfuly updated'}
    else
      render :new
    end
  end

  def destroy
    if @message.destroy
      redirect_to emergencies_path
    else
      redirect_to emergencies_path, flash: {errors: 'Message not deleted'}
    end
  end

  private

    def messages_params
      params[:message].permit(:text)
    end

    # def only_author!
    #   unless @message.user == current_user
    #       redirect_to message_path, flash: {errors: 'Only author can update message!'}
    #     end
    #   end
    # end

    def find_emergency
      @emergency = @message.emergency
    end

    def find_message
        @message = Message.find(params[:id])
    end

end
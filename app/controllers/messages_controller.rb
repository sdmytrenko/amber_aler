class MessagesController < ApplicationController

  before_action :find_message, only: [:edit, :update, :destroy]

  def create
    @message = Message.new(messages_params)
    @message.user = current_user
    @message.emergency = emergency

    if @message.save
      redirect_to emergency_path(@emergency)
    else
      render "emergency/show"
    end
  end

  def edit
  end

  def update
    if @message.update(messages_params)
      redirect to emergency_path(@message.emergency), flash: {notice: 'Post successfuly updated'}
    else
      render :edit
    end
  end

  def destroy
    if @message.destroy
      redirect_to emergencies_path(@message.emergency)
    else
      redirect_to emergencies_path(@message.emergency), flash: {error: 'Message not deleted'}
    end
  end

  private

    def messages_params
      params[:message].permit(:text, :claim_closed)
    end

    def find_message
        @message = Message.find(params[:id])
    end

    def find_emergency
      @emergency ||= Emergency.find(params[:id])
    end
end
class MessagesController < ApplicationController

  # before_action :find_message, only: [:edit, :update, :destroy]
  # before_action :only_author!, only: [:edit, :update, :destroy]

  def new
    @message = Message.new
  end

  def create #http://v32.rusrails.ru/getting-started-with-rails/adding-a-second-model
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
    # if message.update(message_params)
    #   redirect_to emergency_path(@emergency)
    # else
    #   render :edit
    # end
  end

  def update
    # if @message.update
    #   redirect to message_path
    # else
    #   render :new
    # end
  end

  def destroy
    # if @message.destroy
    #   redirect_to emergencies_path
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

    def find_message
        @message = Message.find(params[:id])
    end

end
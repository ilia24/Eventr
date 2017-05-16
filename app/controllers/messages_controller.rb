class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.save

  end

  private
  def message_params
    params.require(:message).permit(:body, :content, :user_id)
  end

end

class PersonalMessagesController < ApplicationController
  # before_action :find_conversation!

  def new
    @personal_message = PersonalMessage.new
  end

  def index
    @personal_messages = PersonalMessage.all
  end

  def show
    @personal_message = PersonalMessage.find(params[:id])
  end

  def create
    @personal_message = PersonalMessage.new(message_params)
    @personal_message.save

  end

  private
  def personal_message_params
    params.require(:personal_message).permit(:body, :content, :user_id)
  end


end

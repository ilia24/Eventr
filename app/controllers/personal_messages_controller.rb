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


  # def find_conversation!
  #
  #   if params[:receiver_id]
  #     @receiver = User.find(params[:receiver_id])
  #     redirect_to(root_path) and return unless @receiver
  #     @conversation = Conversation.between(current_user.id, @receiver.id)[0]
  #   else
  #     @conversation = Conversation.find(params[:conversation_id])
  #     redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
  #   end
  # end
end

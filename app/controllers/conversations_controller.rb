class ConversationsController < ApplicationController


  def new
    @conversation = Conversation.create(name: 'placeholder')
    other_user = User.find(params[:user_id])
    @conversation.users << current_user
    @conversation.users << other_user
    redirect_to user_show_conversation_path, user_id: other_user.id
  end

  def show
    @personal_message = PersonalMessage.new
    @personal_messages = PersonalMessage.all
    @otheruser = User.find(params[:user_id])
    @conversation = Conversation.findconvo(current_user, @otheruser)
    Conversation.findconvo(current_user, @otheruser)
  end

end

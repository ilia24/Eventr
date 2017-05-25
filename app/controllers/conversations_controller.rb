class ConversationsController < ApplicationController


  def new
    other_user = User.find(params[:user_id])

    if Conversation.findconvo(current_user, other_user) != false
      redirect_to user_show_conversation_path, user_id: other_user.id
    else
      @conversation = Conversation.create(name: 'placeholder')
      @conversation.users << current_user
      @conversation.users << other_user
      redirect_to user_show_conversation_path, user_id: other_user.id
    end
  end

  def show
    @personal_message = PersonalMessage.new
    @personal_messages = PersonalMessage.all
    @otheruser = User.find(params[:user_id])
    @conversation = Conversation.findconvo(current_user, @otheruser)
    respond_to do |format|
       format.html do

         if request.xhr?
           render :partial => '/conversations/sidebar_chat', locals: {c: @conversation}
         end
       end
     end
  end

end

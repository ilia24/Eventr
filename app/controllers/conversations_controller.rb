class ConversationsController < ApplicationController


  def new
    other_user = User.find(params[:user_id])

    if Conversation.findconvo(@cuser, other_user) != false
      redirect_to user_show_conversation_path, user_id: other_user.id
    else
      @conversation = Conversation.create
      @conversation.users << @cuser
      @conversation.users << other_user
      respond_to do |format|
         format.html do

           if request.xhr?
             render :partial => '/conversations/sidebar_chat', locals: {c: @conversation}
           end
         end
       end
    end
  end

  def show
    @personal_message = PersonalMessage.new
    @personal_messages = PersonalMessage.all
    @otheruser = User.find(params[:user_id])
    @conversation = Conversation.findconvo(@cuser, @otheruser)
    respond_to do |format|
       format.html do

         if request.xhr?
           render :partial => '/conversations/sidebar_chat', locals: {c: @conversation}
         end
       end
     end
  end

end

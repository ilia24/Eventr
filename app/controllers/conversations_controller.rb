class ConversationsController < ApplicationController


  def new
    convo = Conversation.create(name: 'placeholder')
    convo.users <<  current_user
    convo.users << User.find(params[:user_id])
  end

  def show
    @conversations = Conversation.all
    @personal_message = PersonalMessage.new
    @personal_messages = PersonalMessage.all
    @otheruser = User.find(params[:user_id])
    parsedconvos = []
    @conversations.all.each do |c|
      if c.users.include? current_user
        parsedconvos << c
      end
    end

    parsedconvos.each do |pc|
      if pc.users.include? @otheruser
        @conversation = pc
        @conversation
      end
    end
  end

end

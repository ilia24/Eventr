class ConversationsController < ApplicationController

  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def index
      @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show
      @conversation = Conversation.find_by(id: params[:id])
      @personal_message = PersonalMessage.new
  end

  def new
      redirect_to conversation_path(@conversation) and return if @conversation
      @personal_message = current_user.personal_messages.build
  end

private

  def find_conversation!
    if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      redirect_to(conversation_path(@conversation)) and return unless @receiver
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      redirect_to(conversation_path(@conversation)) and return unless @conversation && @conversation.participates?(current_user)
    end
  end

    def set_conversation
      @conversation = Conversation.find_by(id: params[:id])
    end

    def check_participating!
      redirect_to root_path unless @conversation && @conversation.participates?(current_user)
    end



end

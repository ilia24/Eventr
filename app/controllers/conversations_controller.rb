class ConversationsController < ApplicationController

  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_messages.build
  end

  def index
      @conversations = Conversation.participating(current_user).order('updated_at DESC')
      respond_to do |format|
        format.html
        format.js
      end
  end

  def show
      @conversation = Conversation.find_by(id: params[:id])
      @personal_message = PersonalMessage.new

  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    @personal_message = PersonalMessage.new
  end


private


    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def check_participating!
      redirect_to root_path unless @conversation && @conversation.participates?(current_user)
    end



end

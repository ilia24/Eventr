class HomeController < ApplicationController
  def index
    @events = Event.includes(:goings).first(10)
    if current_user
      @cuser = User.find(current_user)
    end
    # @event = Event.new
    # @group = @event.groups.find(params[:id])
    # @conversation = Conversation.find_by(id: params[:id])
    # @conversations = Conversation.participating(current_user)
  end
end

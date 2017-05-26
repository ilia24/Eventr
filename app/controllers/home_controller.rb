class HomeController < ApplicationController
  def index
    @events = Event.includes(:goings).first(10)
    # @event = Event.new
    # @group = @event.groups.find(params[:id])
    # @conversation = Conversation.find_by(id: params[:id])
    # @conversations = Conversation.participating(current_user)
  end
end

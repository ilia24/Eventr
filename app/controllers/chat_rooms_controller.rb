class ChatRoomsController < ApplicationController
before_action :load_group, :load_event, :load_user
before_action :ensure_logged_in

def new
  @chat_room = ChatRoom.new
end

def index
  @chat_room = ChatRoom.new
  @chat_rooms = ChatRoom.all
end

def display
  @chat_room = @group.chat_room
  @message = Message.new
end

def show
  @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
  @message = Message.new
  @messages = Message.all
end


private

def chat_room_params
  params.require(:chat_room).permit(:group_id, :title, :event_id, :user_id)
end

def load_group
  @group = Group.find(params[:id])
end

def load_event
  @event = Event.find(params[:event_id])
end

def load_user
  @user = User.find(session[:user_id])
end

end

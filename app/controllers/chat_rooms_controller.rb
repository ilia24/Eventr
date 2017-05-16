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

def show
  @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
  @message = Message.new
  @messages = Message.all
end

def create
  @chat_room = @group.chat_rooms.build(chat_room_params)
  if @chat_room.save
    flash[:success] = 'Chat room added!'
    redirect_to event_group_chat_rooms_path(@event, @group, @chat_room)
  else
    render 'new'
  end
end

private

def chat_room_params
  params.require(:chat_room).permit(:title, :group_id,  :event_id, :user_id)
end

def load_group
  @group = Group.find(params[:group_id])
end

def load_event
  @event = Event.find(params[:event_id])
end

def load_user
  @user = User.find(session[:user_id])
end

end

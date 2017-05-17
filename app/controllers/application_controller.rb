class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cookie_set, :load_chatfunc

def load_chatfunc
  @message = Message.new
  @events = Event.all
  @event = Event.new
  @group = Group.new
  @conversation = Conversation.find_by(id: params[:id])
  @conversations = Conversation.participating(current_user)

end

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
  end
end

def cookie_set
    @user = current_user
    return unless current_user
    cookies[:user_id] = @user.id
end


  def ensure_hostinfo_filled_out
    @user = User.find(session[:user_id])
    unless @user.hostinfo != nil
      flash[:alert] = "You have to fill out the information for host before adding a new event"
      redirect_to new_user_hostinfo_path(session[:user_id])
    end
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  helper_method :current_user, :ensure_logged_in, :ensure_hostinfo_filled_out
end

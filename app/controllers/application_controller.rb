class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
  end
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

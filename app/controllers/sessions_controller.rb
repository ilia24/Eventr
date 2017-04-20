class SessionsController < ApplicationController
  def new
  end

  def create
    user= User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in succesfully!'
      redirect_to events_url
    else
      flash[:alert] = 'Email and password combination does not match!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been logged out succesfully!'
    redirect_to events_url
  end
end

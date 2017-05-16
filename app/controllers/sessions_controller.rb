class SessionsController < ApplicationController
  def new
  end

  def create
    user= User.find_by(email: params[:email])

    #if the login details belong to a user
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      cookies.signed[:user_id] = user.id
      flash[:notice] = "Logged in succesfully as #{user.email} !"
      redirect_to events_url

    else
      flash[:alert] = 'Email and password combination does not match!'
      render :new
    end
  end

  def destroy
    # if user is logged in, log out

      session[:user_id] = nil
      cookies.delete(:user_id)
      flash[:notice] = 'User has been logged out succesfully!'
      redirect_to events_url
      #if host is logged in, log out

  end
end

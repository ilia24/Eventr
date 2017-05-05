class SessionsController < ApplicationController
  def new
  end

  def create
    user= User.find_by(email: params[:email])
    host= Host.find_by(email: params[:email])

    #if the login details belong to a user
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in succesfully as #{user.name} !"
      redirect_to events_url

    #if the login details belong to a host
    elsif host && host.authenticate(params[:password])
      session[:host_id] = host.id
      flash[:notice] = "Logged in succesfully as #{host.name}!"
      redirect_to events_url
      
    else
      flash[:alert] = 'Email and password combination does not match!'
      render :new
    end
  end

  def destroy
    # if user is logged in, log out
    if current_user
      session[:user_id] = nil
      flash[:notice] = 'User has been logged out succesfully!'
      redirect_to events_url
      #if host is logged in, log out
    elsif current_host
      session[:host_id] = nil
      flash[:notice] = 'Host has been logged out succesfully!'
      redirect_to events_url

    end

  end
end

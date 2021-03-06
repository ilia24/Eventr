class UsersController < ApplicationController

before_action :ensure_logged_in, only: [:index, :show]

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end

  def new
    @user = User.new
  end

  def create
    if user_params[:avatar] == nil
      f = File.open("app/assets/images/profile-placeholders/profile-placeholder-0#{rand(5) + 1}.png")
      np = user_params.merge(:avatar => f)
      @user= User.new(np)
    else
      @user = User.new(user_params)
    end



    if @user.save
      flash[:notice] = 'Signed up succesfully!'
      session[:user_id] = @user.id
      redirect_to events_url
    else
      render :new
    end


  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
  end



  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end

end

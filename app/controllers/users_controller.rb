class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
end

  def new
    @user = User.new
  end

  def create
    if user_params[:avatar] == nil
      File.open("app/assets/images/brian.jpg") do |f|
      updated_params = user_params.merge(:avatar => f)
      @user= User.new(updated_params)
      end
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

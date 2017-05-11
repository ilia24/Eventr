class EventrinfosController < ApplicationController

before_action :load_user

  def new
    @eventrinfo = Eventrinfo.new
  end

  def create
    # @eventrinfo = @user.eventrinfo.build(eventrinfo_params)
    @eventrinfo = Eventrinfo.new(:first_name => eventrinfo_params[:first_name], :last_name => eventrinfo_params[:last_name],:bio => eventrinfo_params[:bio])
    @eventrinfo.user = current_user
    @user.avatar = eventrinfo_params[:avatar]
    @user.save

    if @eventrinfo.save
      flash[:notice] = 'Eventr profile updated succesfully!'
      redirect_to events_url
    else
      render :new
    end
  end

def edit
  @eventrinfo = User.find(params[:id]).eventrinfo
end

def update
  @eventrinfo = Eventrinfo.find(params[:id])
  if @eventrinfo.update_attributes(:first_name => eventrinfo_params[:first_name], :last_name => eventrinfo_params[:last_name],:bio => eventrinfo_params[:bio])
    @user.avatar = eventrinfo_params[:avatar]
    @user.save
    redirect_to user_path(@user)
  else
    render :edit
  end
end

  def destroy
    @eventrinfo = Eventrinfo.find(params[:id])
    @eventrinfo.destroy
  end

  private
  def eventrinfo_params
    params.require(:eventrinfo).permit(:first_name, :last_name, :bio, :avatar)
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end

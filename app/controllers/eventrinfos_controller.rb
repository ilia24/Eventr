class EventrinfosController < ApplicationController

before_action :load_user
before_action :ensure_proper_user, only: [:create, :edit, :update, :destroy]

  def new
    @eventrinfo = Eventrinfo.new
  end

  def create
    # @eventrinfo = @user.eventrinfo.build(eventrinfo_params)
    @eventrinfo = Eventrinfo.new(:first_name => eventrinfo_params[:first_name], :last_name => eventrinfo_params[:last_name],:bio => eventrinfo_params[:bio])
    @eventrinfo.user = current_user

      if eventrinfo_params[:avatar] != nil
        @user.avatar = eventrinfo_params[:avatar]
        @user.save
      end


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
    if eventrinfo_params[:avatar] != nil
      @user.avatar = eventrinfo_params[:avatar]
      @user.save
    end
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

  def ensure_proper_user
    @user = User.find(params[:user_id])
    if @user != current_user
      flash[:alert] = "you do not have permission to access that page"
      redirect_to root_path
    end
  end

end

class EventrinfosController < ApplicationController

before_action :load_user

  def new
    @eventrinfo = Eventrinfo.new
  end

  def create
    # @eventrinfo = @user.eventrinfo.build(eventrinfo_params)
    @eventrinfo = Eventrinfo.new(eventrinfo_params)
    @eventrinfo.user = current_user

    if @eventrinfo.save
      flash[:notice] = 'Eventr profile updated succesfully!'
      redirect_to events_url
    else
      render :new
    end
  end

def edit
  @eventrinfo = Eventrinfo.find(params[:id])
end

def update
  @eventrinfo = Eventrinfo.find(params[:id])

  if @eventrinfo.update_attributes(eventrinfo_params)
    redirect_to events_url
  else
    render :edit
  end
end

  def destroy

  end

  private
  def eventrinfo_params
    params.require(:eventrinfo).permit(:first_name, :last_name, :bio)
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end

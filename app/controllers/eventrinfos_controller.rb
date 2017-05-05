class EventrinfosController < ApplicationController
  def create
    @eventrinfo = Eventrinfo.new(eventrinfo_params)
    @eventrinfo.user = current_user

    if @eventrinfo.save
      flash[:notice] = 'Eventr profile updated succesfully!'
      redirect_to events_url
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:eventrinfo).permit(:first_name, :last_name, :bio)
  end
end

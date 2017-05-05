class HostsController < ApplicationController
  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)

    if @host.save
      flash[:notice] = 'Signed up succesfully!'
      session[:host_id] = @host.id
      redirect_to events_url
    else
      render :new
    end
  end

  private
  def host_params
    params.require(:host).permit(:email, :name, :description, :capacity, :password, :password_confirmation)
  end
end

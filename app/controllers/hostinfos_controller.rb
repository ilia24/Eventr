class HostinfosController < ApplicationController
  before_action :load_user

    def new
      @hostinfo = Hostinfo.new
    end

    def create
      # @hostinfo = @user.hostinfo.build(hostinfo_params)
      @hostinfo = Hostinfo.new(hostinfo_params)
      @hostinfo.user = current_user

      if @hostinfo.save
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
    def hostinfo_params
      params.require(:hostinfo).permit(:name, :address, :capacity, :website)
    end

    def load_user
      @user = User.find(params[:user_id])
    end

  end

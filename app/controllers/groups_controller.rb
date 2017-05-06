class GroupsController < ApplicationController
  before_action :load_user

  def new
    @group = Group.new
  end


  def create
    @group = @event.groups.build(group_params)

    if @group.save
      flash[:notice] = 'group created succesfully!'
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def load_user
    @event = Event.find(params[:event_id])
  end

end

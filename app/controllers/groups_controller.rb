class GroupsController < ApplicationController
  before_action :load_event

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
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
    params.require(:group).permit(:name, :event_id)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end

end

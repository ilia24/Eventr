class GroupsController < ApplicationController
  before_action :ensure_logged_in, only: [:join, :create]
  before_action :load_event, :load_user

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = @event.groups.build(group_params)
    @group.users << @user

    if @group.save
      flash[:notice] = 'group created succesfully!'
      redirect_to event_path(@event)
    else
      render :new
    end
  end


  def edit
    @group = Group.find(params[:id])
  end
  
  def join
    @group = Group.find(params[:id])
    if @group.users.include? @user
      flash[:notice] = 'You are already in this group'
      redirect_to event_path(@event)
    else
      @group.users << @user
      redirect_to event_path(@event)
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :event_id)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_user
    @user = User.find(session[:user_id])
  end

end

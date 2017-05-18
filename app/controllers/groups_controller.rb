class GroupsController < ApplicationController
  before_action :ensure_logged_in, only: [:join, :create]
  before_action :ensure_eventrinfo_filled_out, only: [:create, :join]
  before_action :load_event, :load_user

  def new
    @group = Group.new
  end

  def show
    @group = @event.groups.find(params[:id])
    @message = Message.new
    @messages = Message.all
    respond_to do |format|
       format.html do

         if request.xhr?
           render :partial => '/groups/sidebar_chat', locals: {g: @group}
         end
       end
     end


  end

  def create
    @event.groups.each do |g|
      if g.users.include? @user
        flash[:notice] = 'You are already in a group!'
        render :status => 400
      end
    end

    @group = @event.groups.build(group_params)


    if  @group.save
      @group.users << @user
      @group.users.first

      @event.adduser(current_user)

      render :partial => '/groups/single_group', locals: {g: @group}
    else
      render :status => 200
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

  def leave
    @group = Group.find(params[:id])

    @group.users.delete(@user)
    flash[:notice] = 'You have left this group!'
    redirect_to event_path(@event)

    if @group.users.empty?
      @group.delete
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
    params.require(:group).permit(:name, :event_id, :description)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_user
    @user = User.find(session[:user_id])
  end

end

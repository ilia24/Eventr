class EventsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create, :destroy, :edit, :update]
  before_action :ensure_hostinfo_filled_out, only: [:new, :create]
  def index

    @event = Event.new
    @events = Event.all

    if params[:search]

        @events = Event.search(params[:search]).order("created_at DESC")
        flash[:notice] = "There are #{@events.count} results matching your search"

    else
      @events = Event.all.order("created_at DESC")
    end


  end

  def show
    @event = Event.find(params[:id])
    @group = @event.groups.build


    if current_user
      @review = @event.reviews.build
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      flash[:alert] = "The event #{@event.name} has been succesfully posted"
      redirect_to events_path
    else
      flash[:alert] = "The event could not be created"
      redirect_to new_event_path
    end

  end


  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

private
  def event_params
    params.require(:event).permit(:name, :price, :picurl, :location, :date, :event_style, :time, :description)
  end

end

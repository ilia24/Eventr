class EventsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy, :edit, :update]
  def index
    @events = Event.all
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])

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

    if @event.save
      redirect_to events_path
    else
      redirect_to new_event_path
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      redirect_back_or_to @event
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

private
  def event_params
    params.require(:event).permit(:name)
  end

end

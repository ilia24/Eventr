class ReviewsController < ApplicationController
  before_action :load_event
  before_action :ensure_logged_in, only: [:create, :destroy]

  def show
    @review= Review.find(params[:id])
  end

  def create
    @review = @event.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = 'Review posted succesfully!'
      redirect_to events_url
    else
      flash[:alert] = 'Review NOT posted!'
      render 'events/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :event_id)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end
end

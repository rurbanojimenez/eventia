class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.mis_eventos.build(params[:event])
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      # @feed_items = []
      render "new"
    end
  end

  def show
  	@event = Event.find(params[:id])
  end

  def index
  	@events = Event.all
  end

  def destroy
  end
end
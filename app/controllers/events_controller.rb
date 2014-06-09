class EventsController < ApplicationController
  before_filter :authenticate_user!

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.mis_eventos.build(params[:event])
    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_url
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
    @ev = Event.find(params[:id])
    @ev.destroy
    flash[:success] = "Event deleted."
    redirect_to events_url
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      respond_to do |format|
        format.json{render nothing: true, status: 204} 
      end
    else
      respond_to do |format|
        format.json{render nothing: true, status: 422} 
      end
    end
  end
end
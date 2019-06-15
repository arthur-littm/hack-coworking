class EventsController < ApplicationController

  def index
    @events = Event.all
  end

   def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, notice: "Something went wrong"
    end
  end


  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :name)
  end
end

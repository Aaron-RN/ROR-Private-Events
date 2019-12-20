class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      redirect_to @event.creator
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def events_params
    params.require(:event).permit(:title, :location, :date, :description)
  end

end

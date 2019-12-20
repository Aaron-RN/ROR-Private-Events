class EventsController < ApplicationController
  before_action :logged_in?, only: %i[create]

  def index
    @events = Event.all
    @past_events = Event.past_events
    @upcoming_events = Event.upcoming_events
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

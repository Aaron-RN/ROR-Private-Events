class EventsController < ApplicationController
  before_action :logged_in?, only: %i[create new going_to]

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

  # Method used to let users confirm their attendance to the event
  def going_to
    @event = Event.find(params[:format])
    return unless @event

    @event.attendees.each do |a|
      return if a.id == current_user.id
    end

    @event.attendance.build(user_id:current_user.id)
    if @event.save
        flash[:notice] = 'Now attending this event'
        redirect_to @event
    end
  end
  
  private

  def events_params
    params.require(:event).permit(:title, :location, :date, :description)
  end
end

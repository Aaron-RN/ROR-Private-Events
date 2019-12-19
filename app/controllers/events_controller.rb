class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
  end
end

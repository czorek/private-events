class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.save
    flash[:success] = 'Event created'
    redirect_to @event
  end

  private

    def event_params
      params.require(:event).permit(:time, :description)
    end
end


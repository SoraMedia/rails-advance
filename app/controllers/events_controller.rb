class EventsController < ApplicationController
  def index
    @events = Event.order(created_at: :desc)
    @events = Event.order(held_on: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end
end

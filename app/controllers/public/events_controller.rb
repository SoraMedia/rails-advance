class Public::EventsController < ApplicationController
  def index
    @events = Event.order(held_on: :desc, created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end
end

module Admin
  class EventsController < ApplicationController
    before_action :require_admin_login
    before_action :set_event, only: %i[show edit update destroy]

    def index
      @events = Event.order(created_at: :desc)
    end

    def show
      @event = Event.find(params[:id])
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to admin_event_path(@event), notice: "イベントを登録しました"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      if @event.update(event_params)
        redirect_to admin_event_path(@event), notice: "イベントを更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to admin_events_path, notice: "イベントを削除しました"
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :held_on, :organizer_name, :target_department)
    end
  end
end

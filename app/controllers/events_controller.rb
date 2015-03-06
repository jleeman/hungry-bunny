class EventsController < ApplicationController

  def index
    @events = Event.all.order("event_date DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:cocktail, :description, :title, :photo, :event_date, :event_time, :course_1, :course_2, :course_3, :course_4, :address, :dessert, :event_type)
  end
end

class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:cocktail, :description, :title, :photo, :event_date, :event_time, :course1, :course2, :course3, :course4, :address, :dessert, :event_type)
  end
end
class Admin::EventsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "You have successfully created an event!"
      redirect_to event_path(@event)
    else
      flash[:error] = "Please review required fields."
      render :new
    end
  end

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = "You do not have access."
      redirect_to root_path
    end
  end

  def event_params
    params.require(:event).permit(:cocktail, :description, :photo, :event_date, :event_time, :address, :dessert, :course_1, :course_2, :course_3, :title, :event_type, courses_attributes: [:id, :event_id, :label, :description, :_destroy])
  end
end

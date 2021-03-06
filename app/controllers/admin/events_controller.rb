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
      redirect_to admin_event_path(@event)
    else
      flash[:error] = "Please review required fields."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Successfully updated event."
      redirect_to admin_event_path(@event)
    else
      render :edit
    end
  end

  def index
    @events = Event.all.order("event_date DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = "You do not have access."
      redirect_to root_path
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :address, :photo, :event_date, :event_time, :event_type, courses_attributes: [:id, :event_id, :label, :description, :_destroy], reservations_attributes: [:id, :event_id, :email, :num_guests, :message, :first_name, :last_name, :_destroy])
  end
end

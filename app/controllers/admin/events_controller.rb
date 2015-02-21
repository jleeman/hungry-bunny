class Admin::VideosController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "You have successfully added #{@event.title}."
      redirect_to new_admin_video_path
    else
      flash[:danger] = "Please review required fields."
      render :new
    end
  end

  private

  def require_admin
    if !current_user.admin?
      flash[:danger] = "You do not have access."
      redirect_to home_path
    end
  end

  def event_params
    params.require(:event).permit(:cocktail, :description, :photo, :date, :time, :address, :dessert, :course_1, :course_2, :course_3, :title, :type)
  end
end

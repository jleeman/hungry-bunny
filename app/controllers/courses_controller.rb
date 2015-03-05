class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def event_params
    params.require(:course).permit(:label, :description, :event_id)
  end
end

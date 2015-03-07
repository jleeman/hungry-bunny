class CoursesController < ApplicationController
  def index
    @courses = Course.all(:order => 'id ASC', :limit => 20)
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:label, :description, :event_id)
  end
end

class PagesController < ApplicationController
  def front
    @events = Event.all.order("event_date desc").limit(3)
  end

  def about
  end

  def catering
  end

  def community
  end

  def faq
  end

  def contact
  end

  def index
    @pages = Page.all.order("event_date DESC")
  end

  def show
    @page = Page.find(params[:id])
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end

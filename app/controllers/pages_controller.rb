class PagesController < ApplicationController
  def front
    @events = Event.all.order("event_date desc").limit(3)
  end

  def about
    @page = Page.find_by title: 'About'
  end

  def catering
    @page = Page.find_by title: 'Catering'
  end

  def community
    @page = Page.find_by title: 'Community'
  end

  def faq
    @page = Page.find_by title: 'FAQ'
  end

  def contact
    @page = Page.find_by title: 'Contact'
  end

  def index
    @pages = Page.all.order("created_at DESC")
  end

  def show
    @page = Page.find(params[:id])
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end

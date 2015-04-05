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
end

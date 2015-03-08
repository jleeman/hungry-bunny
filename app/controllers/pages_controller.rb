class PagesController < ApplicationController
  def front
    @events = Event.all.order("event_date desc").limit(3)
  end

  def about
  end
end

class Event < ActiveRecord::Base
  validates_presence_of :title, :description, :event_type, :event_date
end

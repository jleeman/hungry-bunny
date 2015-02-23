class Event < ActiveRecord::Base
  mount_uploader :photo, EventImageUploader
  validates_presence_of :title, :description, :event_type, :event_date
end

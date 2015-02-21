class Event < ActiveRecord::Base
  validates_presence_of :title, :description, :type
end

class Event < ActiveRecord::Base
  mount_uploader :photo, EventImageUploader

  has_many :courses, -> { order 'created_at DESC' }

  accepts_nested_attributes_for :courses, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :title, :description, :event_type, :event_date, :event_time
end

class Event < ActiveRecord::Base
  mount_uploader :photo, EventImageUploader

  has_many :courses, -> { order 'id ASC' }, dependent: :destroy
  has_many :reservations, -> { order 'id ASC' }, dependent: :destroy

  accepts_nested_attributes_for :courses, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :reservations, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :title, :description, :address, :event_type, :event_date, :event_time
end

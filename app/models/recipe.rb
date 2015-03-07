class Recipe < ActiveRecord::Base
  mount_uploader :photo, EventImageUploader

  has_many :ingredients, -> { order 'id ASC' }
  has_many :instructions, -> { order 'step ASC' }


  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :instructions, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :title, :description
end

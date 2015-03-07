class Recipe < ActiveRecord::Base
  mount_uploader :photo, EventImageUploader

  has_many :ingredients, -> { order 'id ASC' }, dependent: :destroy
  has_many :instructions, -> { order 'step ASC' }, dependent: :destroy


  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :instructions, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :title, :description
end

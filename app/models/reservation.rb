class Reservation < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :email, :first_name, :last_name, :num_guests
end

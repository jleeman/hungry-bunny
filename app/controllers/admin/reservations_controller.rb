class ReservationsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def index
    @reservations = Reservation.all.order("created_at DESC")
  end

  private

  def reservation_params
    params.require(:reservation).permit(:email, :num_guests, :message, :event_id)
  end
end

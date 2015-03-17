class Admin::ReservationsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def index
    @reservations = Reservation.all.order("created_at DESC")
    @events = Event.all.order("created_at DESC")
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to admin_reservations_path
  end

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = "You do not have access."
      redirect_to root_path
    end
  end

  def reservation_params
    params.require(:reservation).permit(:email, :num_guests, :message, :event_id)
  end
end

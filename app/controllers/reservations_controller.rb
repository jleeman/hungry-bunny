class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @reservation.event_id = params[:event_id]
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to root_path
    else
      flash[:error] = "Please review required fields."
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:email, :num_guests, :first_name, :last_name, :message, :event_id)
  end
end

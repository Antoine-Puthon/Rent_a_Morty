class ReservationsController < ApplicationController

  def create
    @morty = Morty.find(params[:morty_id])
    @reservation = Reservation.new
    @reservation.user = current_user
    @reservation.morty = @morty
    if @reservation.save

      redirect_to reservation_path(@reservation)
    else
      redirect_to morty_path(@morty)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end

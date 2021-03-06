class ReservationsController < ApplicationController

  def create
    @morty = Morty.find(params[:morty_id])
    @reservation = Reservation.new
    @reservation.user = current_user
    @reservation.morty = @morty
    if @reservation.save
      @reservation.pending!
      redirect_to reservation_path(@reservation)
    else
      redirect_to morty_path(@morty)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @morty = @reservation.morty
    @reservation.destroy
    redirect_to morty_path(@morty)
  end

  def update
    morty_id = Reservation.find(params[:id]).morty_id
    @morty = Morty.find(morty_id)
    @reservation = Reservation.find(params[:id])
    @reservation.favori = true
    @reservation.save
    redirect_to morty_path(@morty)
  end
end

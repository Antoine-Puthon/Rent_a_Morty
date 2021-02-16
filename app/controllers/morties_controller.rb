class MortiesController < ApplicationController

  def new
    @morty = Morty.new
  end

  def create
    @morty = Morty.new(morty_params)
    @morty.user = current_user
    if @morty.save
      redirect_to morty_path(@morty)
    else
      render :new
    end
  end

  def show
    @morty = Morty.find(params[:id])
    @reservation = Reservation.find_or_initialize_by(user: current_user, morty: @morty)
  end

  def update
    @morty = Morty.find(params[:id])
    @reservation = @morty.reservations.last
    @reservation.confirmation!
    @reservation.save!
    redirect_to morty_path(@morty)
  end

  private

  def morty_params
    params.require(:morty).permit(:name,:price,:description,:state,:rarity,:photo)
  end
end

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
    @reservation = Reservation.find_or_initialize_by(morty: @morty)
  end

  def update
    @morty = Morty.find(params[:id])
    @reservation = @morty.reservations.last
    @reservation.confirmation!
    @reservation.save!
    redirect_to morty_path(@morty)
  end

  def index
    @morties = Morty.all
    if !(params[:request][:name].blank?)
      sql_query = "morties.name @@ :name"
      @morties = @morties.where(sql_query, name: "%#{params[:request][:name]}%")
    end
    if !(params[:request][:price].blank?)
      min = params[:request][:price].split("-").first
      max = params[:request][:price].split("-").last
      sql_query = "morties.price >= :min AND morties.price < :max"
      @morties = @morties.where(sql_query, min: min, max: max)
    end
    if !(params[:request][:state].blank?)
      sql_query = "morties.state @@ :state"
      @morties = @morties.where(sql_query, state: "%#{params[:request][:state]}%")
    end
    if !(params[:request][:rarity].blank?)
      sql_query = "morties.rarity @@ :rarity"
      @morties = @morties.where(sql_query, rarity: "%#{params[:request][:rarity]}%")
    end
  end



  private

  def morty_params
    params.require(:morty).permit(:name,:price,:description,:state,:rarity,:photo)
  end
end

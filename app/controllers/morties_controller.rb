class MortiesController < ApplicationController

  def new
    @morty = Morty.new
  end

  def create
    @morty = Morty.new(morty_params)
    if @morty.save
      redirect_to morty_path(@morty)
    else
      render :new
    end
  end

  def show
    @morty = Morty.find(params[:id])
  end

  private

  def morty_params
    params.require(:morty).permit(:name,:price,:description,:state,:rarity,:photo)
  end
end

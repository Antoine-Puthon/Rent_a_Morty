class ReviewsController < ApplicationController
before_action :set_morty, only: [:index, :new]
before_action :set_review, only: [ :edit, :update ]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.morty = Morty.find(params[:morty_id])
    @morty = @review.morty
    if @review.save
        redirect_to morty_path(@morty)
      else
        render 'morties/show'
    end
  end


  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

  def set_morty
    @morty = Morty.find(params[:morty_id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_review
     @review = Review.find(params[:id])
  end

end

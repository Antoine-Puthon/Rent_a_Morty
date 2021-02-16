class ReviewsController < ApplicationController
before_action :set_morty, only: [:index, :new]
before_action :set_review, only: [ :edit, :update ]


  def index
    @reviews = @morty.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.camp = Morty.find(params[:camp_id])
    @morty = @review.morty
    if @review.save
        redirect_to morty_path(@morty)
      else
        render 'morties/show'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to user_path(@review.user)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end


  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
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

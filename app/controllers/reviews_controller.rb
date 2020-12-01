class ReviewsController < ApplicationController
  before_action :set_review, only: %i[destroy]

  def new
    @review = Review.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    review = Review.new(review_params)
    cocktail = Cocktail.find(params[:cocktail_id])
    review.cocktail = cocktail
    review.save

    redirect_to cocktail_path(cocktail)
  end

  def destroy
    @review.destroy
    cocktail = @review.cocktail

    redirect_to cocktail_path(cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :cocktail_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end

class ReviewsController < ApplicationController
  def index
    render json: { review: Review.all }
  end

  def delete
    Review.find(params[:id])
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: { review: review }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:breeds_id, :user_id, :kid_friendly, :dog_friendly, :barking_lvl, :trainability, :energy_lvl)
  end
end

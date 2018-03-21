class Api::V1::ReviewsController < ApiController
  before_action :authenticate_user!
  def index
    reviews = Review.all
    render json: reviews
  end

  def new
    render json: {breed: Breed.find(params[:id])}
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      render json: { messages: ["Saved new review"], reviews: Review.all }
    else
      render json: { messages: @review.errors.full_messages }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to breeds_path
  end

  private

  def review_params
    params.require(:review).permit(:breed_id, :user_id, :kid_friendly, :dog_friendly, :barking_lvl, :trainability, :energy_lvl)
  end
end

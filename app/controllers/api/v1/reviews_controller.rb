class Api::V1::ReviewsController < ApiController
  skip_before_action :verify_authenticity_token
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
        render json: { status: 'Success', message: 'Saved new review', review: @review, user: current_user }, status: :ok
      else
        render json: { status: 'Error', message: @review.errors }
      end
    end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to breeds_path
  end

  private

  def review_params
    params.require(:review).permit(:breed_id, :kid_friendly, :dog_friendly, :barking_lvl, :trainability, :energy_lvl, :body)
  end
end

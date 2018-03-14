class Api::V1::ReviewsController < ApiController
  def index
    render json: { review: Review.all }
  end

  def new
    @breed = Breed.find(params[:breed_id])
    @review = Review.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to breeds_path
  end

  def create
    @breed = Breed.find(params[:breed_id])
    @review = Review.new(review_params)
    @review.breed = @breed
    @user = User.find(params[:user_id])
    @review.user = @user

    if @review.save
      flash[:success] = 'Review Submitted'
      redirect_to breed_path(@breed)
    else
      flash[:errors] = @review.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:breed, :user, :kid_friendly, :dog_friendly, :barking_lvl, :trainability, :energy_lvl)
  end
end

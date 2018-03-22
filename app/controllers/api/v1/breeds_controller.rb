class Api::V1::BreedsController < ApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    render json: {breeds: Breed.all}
  end

  def show
    breed = Breed.find(params[:id])
    users = []
    reviews = breed.reviews.order('created_at DESC')
    reviews.each do |review|
      users << review.user
    end
    render json: { breed: breed, reviews: reviews, users: users }
  end

  def new;end

  def create
    @breed = Breed.new(breed_params)
    @breed.user = current_user
    if @breed.save
      render json: { breed: @breed }
    else
      render json: { errors: @breed.errors.full_messages }, status: :unprocessable_entity
    end
  end


def destroy
  breed = Breed.find(params[:id])
  render json: { breeds: Breed.all}
  if beer.destroy
    flash[:notice] = 'Deleted Breed!'
  end
end

  private

  def breed_params
    params.require(:breed).permit(:name, :life_expectancy, :personality, :shedding, :height, :weight, :grooming, :img_url)
  end
end

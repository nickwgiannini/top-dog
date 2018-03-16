class Api::V1::BreedsController < ApiController

  def index
    render json: {breeds: Breed.all}
  end
  
  def show
    breed = Breed.find(params[:id])
    reviews = breed.reviews
    render json: { breed: breed, reviews: reviews }
  end

  private

  def breed_params
    params.require(:breed).permit(:name, :life_expectancy, :personality, :shedding, :height, :weight, :grooming, :img_url)
  end
end

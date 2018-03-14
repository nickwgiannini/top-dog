class Api::V1::BreedsController < ApiController

  def index
    render json: Breed.all
  end
end

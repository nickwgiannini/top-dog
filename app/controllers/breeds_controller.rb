class BreedsController < ApplicationController
  def index
    render json: { review: Breed.all }
  end

  def show
    render json: { review: Breed.find(params[:id]) }
  end

  def delete
    Breed.find(params[:id])
  end

  def create
    breed = Breed.new(breed_params)
    if breed.save
      render json: { breed: breed }
    else
      render json: { error: breed.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def breed_params
    params.require(:breed).permit(:name, :life_expectancy, :personality, :shedding, :height, :weight, :grooming, :img_url)
  end
end

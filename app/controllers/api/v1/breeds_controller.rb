class Api::V1::BreedsController < ApiController
  skip_before_action :verify_authenticity_token

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
    render json: { breed: breed, reviews: reviews, users: users}
  end

  def destroy
    if current_user.admin?
      @breed = Breed.find(params[:id])
      @breed.destroy
      flash[:success]= "Deleted breed"
    else
      flash[:error]= "Only Admins can delete dogs."
    end
  end

end

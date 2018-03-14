class Api::V1::BreedsController < ApiController

  def index
    render json: Breed.all
  end


   def show
     render json: { breed: Breed.find(params[:id]) }
   end
#
#   def destroy
#     @breed = Breed.find(params[:id])
#     @breed.destroy
#
#     redirect_to breeds_path
#   end
#
# # admin feature. dont allow users to create breeds
#   def create
#     @breed = Breed.new(breed_params)
#     if @breed.save
#       flash[:success] = 'Breed Submitted'
#       redirect_to breed_path(@breed)
#     else
#       flash[:errors] = @breed.errors.full_messages.join(', ')
#       render :new
#     end
#   end
#
#   private
#
#   def breed_params
#     params.require(:breed).permit(:name, :life_expectancy, :personality, :shedding, :height, :weight, :grooming, :img_url)
#   end
 end

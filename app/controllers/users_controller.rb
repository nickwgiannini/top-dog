class UsersController < ApplicationController
  def index
    render json: { review: User.all }
  end

  def show
    render json: { review: User.find(params[:id]) }
  end

  def delete
    User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: user }
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :sign_in_count)
  end
end

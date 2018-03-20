class UsersController < ApplicationController
  def index
    render json: { user: User.all }
  end

  def show
    render json: { user: User.find(params[:id]) }
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :sign_in_count, :username)
  end
end

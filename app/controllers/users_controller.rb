class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    u = User.new
    u.avatar = params[:file] 
  end

  def show
    @user = User.find(params[:id])
  end
end

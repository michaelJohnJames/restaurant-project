class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find_by_id(params[:id])

  end

  def new
  end

  def create

  end

  def show
    @user = current_user
    @restuarant = Restaurant.find_by_id(params[:id])
  end

  def edit
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to new_restaurant_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:location, :email, :first_name, :last_name)
  end
end

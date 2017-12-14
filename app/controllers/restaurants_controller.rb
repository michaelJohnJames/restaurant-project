class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by_id(params[:id])
  end

  def show
    get_restaurant
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = current_user
    get_place
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

      if @restaurant.save
        redirect_to user_path(current_user)
      else
        redirect_to new_restaurant_path
      end
  end

  def edit
    get_restaurant
  end

  def update
    get_restaurant
    @user = User.find_by_id(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to user_path(current_user)
  end


  def destroy
    get_restaurant
    @restaurant.destroy
    redirect_to user_path(current_user)
  end

  private

  def get_place
    @client = GooglePlaces::Client.new(ENV['GOOGLE_CLIENT_ID'])
    @spot = @client.spots_by_query("Restaurant near #{@user.location}")
    @place = @spot[rand(@spot.count)]
  end

  def get_restaurant
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def user_params
    params.permit(:id)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :review, :order, :user_id, :address)
  end


end

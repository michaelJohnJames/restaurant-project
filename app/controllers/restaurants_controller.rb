class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    get_user
  end

  def show
    get_restaurant
    get_user
  end

  def new
    @user = current_user
    get_place
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
    get_user
    @restaurant.update(restaurant_params)
    redirect_to user_path(current_user)
  end


  def destroy
    get_restaurant
    @restaurant.destroy
    redirect_to user_path(current_user)
  end

  private

# method to get restaurant from google places api
  def get_place
    @spot = ((GooglePlaces::Client.new(ENV['GOOGLE_CLIENT_ID'])).spots_by_query("Food near #{@user.location}"))
    @place = @spot[rand(20)]
    @url = @place.photos[0].fetch_url(800)
  end

  def get_restaurant
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def get_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.permit(:id)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :review, :order, :user_id, :address)
  end


end

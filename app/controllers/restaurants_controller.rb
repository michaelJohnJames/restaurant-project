class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by_id(params[:id])
  end

  def show

  end

  def new
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
  end

  def destroy
  end

  private

  def get_place
    @client = GooglePlaces::Client.new(ENV['GOOGLE_CLIENT_ID'])
    @spot = @client.spots_by_query('Food near Philadelphia, Pennsylvania')
    @place = @spot[rand(@spot.count)]
  end

  def user_params
    params.permit(:id)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :review, :order, :user_id, :address)
  end


end

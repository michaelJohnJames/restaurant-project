class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index

    @user = User.find_by_id(params[:id])
  end

  def show

  end

  def new
    get_place
    @user = current_user

  end

  def create

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


end

class RestaurantsController < ApplicationController

  before_action :authenticate_user!

  def index

  end

  def show
    get_place
  end

  def new


  end

  def create

  end

  def edit
  end

  def destroy
  end

  private

  def get_place
    #uri =

    @client = GooglePlaces::Client.new(ENV['GOOGLE_CLIENT_ID'])
    #@spot = @client.spots_by_query('food near Scranton, Pennsylvania')
    @spot = @client.spots_by_query('Pizza near Philadelphia, Pennsylvania')
    #url = @spot.photos[0].fetch_url(800)
    #@spot = @client.spot('Pizza near Miami')

    #@obj = JSON.parse(response)

     #pp @obj
    #parsed_json = ActiveSupport::JSON.decode(response)
  end


end

class RestaurantsController < ApplicationController

  before_action :authenticate_user!

  def index
    get_place
  end

  def show
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
    @spot = @client.spots_by_query('food near Scranton, Pennsylvania')
    #@spot = @client.spot('Pizza near Miami')

    #@obj = JSON.parse(response)

     #pp @obj
    #parsed_json = ActiveSupport::JSON.decode(response)
  end


end

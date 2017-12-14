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

  def destroy
  end
end

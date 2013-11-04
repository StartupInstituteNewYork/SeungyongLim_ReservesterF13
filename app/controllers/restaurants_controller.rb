class RestaurantsController < ApplicationController
  def index
  end
  def new
  end
  def create
  	@restaurant = Restaurant.new(post_params)
  	@restaurant.save

  	redirect_to @restaurant	
  end
  def show
  	@restaurant=Restaurant.find(params[:id])
  end

private
  def post_params
  	params.require(:restaurant).permit(:name, :description, :full_address, :phone_number)
  end
end


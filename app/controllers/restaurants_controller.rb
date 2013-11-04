class RestaurantsController < ApplicationController
  
  def index
    @restaurants=Restaurant.all
  end
  
  def new
    @restaurant=Restaurant.new
  end
  
  def create
  	@restaurant = Restaurant.new(post_params)
  	@restaurant.save

  	redirect_to @restaurant	
  end
  
  def show
  	@restaurant=Restaurant.find(params[:id])
  end

  def edit
    @restaurant=Restaurant.find(params[:id])
  end

  def update
    @restaurant=Restaurant.find(params[:id])
    @restaurant.update(post_params)
    redirect_to @restaurant
  end

  def destroy
    @restaurant=Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

private
  def post_params
  	params.require(:restaurant).permit(:name, :description, :full_address, :phone_number)
  end
end


class RestaurantsController < ApplicationController

  before_filter :authenticate_owner!, only: [:new, :create]
  before_filter :confirm_owner, only: [:edit, :update, :destroy]
  
  def index
    @restaurants = Restaurant.all
  end
  
  def new   
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = current_owner.restaurants.build(params_restaurant)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render action: "new" 
    end
  end
  
  def show
  	@restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.build
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(params_restaurant)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

  def page
      @names = Restaurant.find_all_by_name(params[:search_string])
      @search_string=params[:search_string]
  end
  
private
  def params_restaurant
    params.require(:restaurant).permit(:name, :description, :full_address, :phone_number, :image, :menu, :remote_image_url)
  end


  def confirm_owner
    restaurant = Restaurant.find(params[:id])
    if restaurant.owner != current_owner
      redirect_to :back, flash: {:alert =>"you don't own this restaurant"}
    end
  end
end




class RestaurantsController < ApplicationController

  before_filter :authenticate_owner!, only: [:new, :create]
  before_filter :confirm_ownership, only: [:edit, :update, :destroy]
  
  def index
    @restaurants=Restaurant.all
  end
  
  def new
    @restaurant=Restaurant.new
  end
  
  def create
    @restaurant=current_owner.restaurants.build(params[:restaurant])
  	@restaurant.save

  	redirect_to @restaurant, notice: "Restaurant was successfully created"
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
    redirect_to @restaurant, notice: "Restaurant was successfully updated"
  end

  def destroy
    @restaurant=Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

private
  def confirm_ownership
    restaurant = Restaurant.find(params[:id])
    if restaurant.owner != current_owner
      redirect_to :back, :flash => "{:alert =>you don't own this restaurant."
    end
  end

  def post_params
  	params.require(:restaurant).permit(:name, :description, :full_address, :phone_number)
  end
end


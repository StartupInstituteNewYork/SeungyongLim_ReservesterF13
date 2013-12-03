class ReservationsController < ApplicationController

	def create
		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservation=@restaurant.reservations.create(post_reservation)
		redirect_to :back
	end


private
	def post_reservation
		params.require(:reservation).permit(:email, :requested_date, :message )
	end

	 
end

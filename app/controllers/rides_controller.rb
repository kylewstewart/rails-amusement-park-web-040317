class RidesController < ApplicationController

  def create
    @user = current_user
    ride = Ride.new(user_id: @user.id, attraction_id: params[:attraction_id])
    flash[:notice] = ride.take_ride
    redirect_to user_path(@user)
  end

end

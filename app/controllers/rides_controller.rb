class RidesController < ApplicationController

    def new
    end

    def create
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:options][:params][:attraction_id])
        @ride = Ride.new(user_id: session[:user_id], attraction_id: params[:options][:params][:attraction_id])
        message = @ride.take_ride
        flash[:notice] = message
        redirect_to user_path(@user)
    end


end
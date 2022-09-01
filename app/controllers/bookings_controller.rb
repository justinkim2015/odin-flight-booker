class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @pass_num = params[:number_of_passengers].to_i
  end

  def create
  end

  private

  def bookings_params
    params.require(:flight).permit(:id, :pass_num)
  end
end

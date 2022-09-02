class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @pass_num = params[:number_of_passengers].to_i

    # @booking = Booking.new(bookings_params)
    @booking = Booking.new
    @booking.build_passenger
    # Maybe I can fix this by having the form be created several times in the view
  end

  def create
    @booking = Booking.new
    @booking.save
  end

  private

  def bookings_params
    params.require(:booking).permit(passenger_attributes: [:name, :email])
  end
end

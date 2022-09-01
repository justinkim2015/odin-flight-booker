class BookingsController < ApplicationController
  def new
    # @booking = Booking.new(bookings_params)
  end

  def create
  end

  private

  def bookings_params
    params.require(:flight).permit(:id, :pass_num)
  end
end

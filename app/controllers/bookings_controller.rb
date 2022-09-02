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
    @booking = Booking.new(bookings_params)
    @booking.flight_id = 1
    passenger = Passenger.create(name: params[:booking][:passenger_attributes][:name], 
                                 email: params[:booking][:passenger_attributes][:email])
    @booking.passenger_id = passenger.id

    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render new_booking_path, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def bookings_params
    params.require(:booking).permit(passenger_attributes: [:name, :email])
  end
end

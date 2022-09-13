class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @pass_num = params[:number_of_passengers].to_i

    @booking = Booking.new
    @pass_num.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(flight_id: params[:booking][:flight_id])

    if @booking.save
      params[:booking][:num_pass].to_i.times do |i|
        passenger = @booking.passengers.create(name: params[:booking][:passengers_attributes][:"#{i}"][:name],
                                               email: params[:booking][:passengers_attributes][:"#{i}"][:email])

        PassengerMailer.with(passenger: passenger).confirmation_email.deliver_later
      end

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

  def make_passenger(i)
  end
end

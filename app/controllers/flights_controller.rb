class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_airports = Flight.all.map { |flight| [flight.departure_loc, flight.departure_airport_id] }
    @arrival_airports = Flight.all.map { |flight| [flight.arrival_loc, flight.arrival_airport_id] }
    @flight_date = Flight.all.order(:flight_date).map { |flight| [flight.flight_date, flight.flight_date] }
    
    @params_flights = @flights.find_flight(params)
  end
end

# @start_time = Flight.all.order(:start_time).map { |flight| [flight.start_time, flight.start_time.to_s[0..18]] }

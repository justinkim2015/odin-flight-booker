class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_airports = Flight.all.map{ |flight| [ flight.departure_airport.airport_code, flight.departure_airport_id ] }
    @arrival_airports = Flight.all.map{ |flight| [ flight.arrival_airport.airport_code, flight.arrival_airport_id ] }
    @departure_date = Flight.all.map{ |flight| [ flight.start_time, flight.start_time ] }
  end
end

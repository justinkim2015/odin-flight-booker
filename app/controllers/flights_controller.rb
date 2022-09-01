class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_airports = Flight.all.map { |flight| [flight.departure_loc, flight.departure_airport_id] }
    @arrival_airports = Flight.all.map { |flight| [flight.arrival_loc, flight.arrival_airport_id] }
    @start_time = Flight.all.order(:start_time).map { |flight| [flight.start_time, flight.start_time.to_s[0..18]] }
    
    @params_flights = @flights.find_flight(params)
  end
end

# Possible methods to solve my problem

# 1: Add another column to my DB with the mo/day/year so that I can search by the date and then display all the times of
#    the flight.

# 2: Get all departing and incoming flights from one airport to another then sift through them like I was before.

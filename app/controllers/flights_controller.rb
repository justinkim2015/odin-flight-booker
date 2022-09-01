class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_airports = Flight.all.map { |flight| [flight.departure_loc, flight.departure_airport_id] }
    @arrival_airports = Flight.all.map { |flight| [flight.arrival_loc, flight.arrival_airport_id] }
    @start_time = Flight.all.order(:start_time).map { |flight| [flight.start_time, flight.start_time.to_s[0..18]] }
    @params_flights = @flights.all_departures(params[:departure_airport]).all_arrivals(params[:arrival_airport]).all_times(params[:start_time])
  end
end
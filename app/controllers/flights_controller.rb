class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_airports = Flight.all.map { |flight| [flight.departure_loc, flight.departure_airport_id] }
    @arrival_airports = Flight.all.map { |flight| [flight.arrival_loc, flight.arrival_airport_id] }
    # @start_time = Flight.all.order(:start_time).map { |flight| [flight.pretty_date, flight.start_time.to_s[0..9]] }
    @start_time = Flight.all.order(:start_time).map { |flight| [flight.pretty_date, flight.start_time] } # THIS IS TESTING

    @params_flights = @flights.all_departures(params[:departure_airport]).all_arrivals(params[:arrival_airport])
    @time = @flights.where("start_time = ?", params[:start_time])
  end
end

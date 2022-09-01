class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  scope :all_departures, ->(departure) { where("departure_airport_id = ?", departure) }
  scope :all_arrivals, ->(arrival) { where("arrival_airport_id = ?", arrival) }
  scope :all_times, ->(time) { where("start_time = ?", time)}
  scope :all_dates, ->(date) { where("flight_date = ?", date)}

  def pretty_date
    "#{start_time.month}-#{start_time.day}-#{start_time.year}"
  end

  def pretty_time
    "#{start_time.hour}:#{start_time.min}"
  end

  def departure_loc
    departure_airport.airport_code
  end

  def arrival_loc
    arrival_airport.airport_code
  end

  def display_info
    "#{departure_loc} -> #{arrival_loc}: #{pretty_date} / #{pretty_time}"
  end

  def self.find_flight(params)
    Flight.all.all_departures(params[:departure_airport]).all_arrivals(params[:arrival_airport]).all_dates(params[:flight_date])
  end
end

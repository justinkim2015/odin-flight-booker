class AddManyThingsToFlight < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :departure_airport
    add_reference :flights, :arrival_airport
    add_column :flights, :start_time, :datetime
    add_column :flights, :flight_duration, :integer
  end
end

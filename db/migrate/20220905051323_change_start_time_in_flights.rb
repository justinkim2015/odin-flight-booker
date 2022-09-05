class ChangeStartTimeInFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :start_time
    add_column :flights, :start_time, :time
  end
end

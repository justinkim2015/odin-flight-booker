class AddAirportCodeToAirport < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :airport_code, :string
  end
end

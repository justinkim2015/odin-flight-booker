class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings

  def display_info
    "#{name} - #{email}"
  end
end

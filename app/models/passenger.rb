class Passenger < ApplicationRecord
  belongs_to :booking

  def display_info
    "#{name} - #{email}"
  end
end

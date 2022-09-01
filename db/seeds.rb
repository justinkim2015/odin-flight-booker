# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding..."
Airport.destroy_all 
Flight.destroy_all

hnl = Airport.create(airport_code: 'HNL')
hnd = Airport.create(airport_code: 'HND')
nrt = Airport.create(airport_code: 'NRT')
fuk = Airport.create(airport_code: 'FUK')

def make_flights(start_id, finish_id, length)
  now = Time.now
  # one_year_later = Time.now + 60 * 60 * 24 * 365
  # one_week_later = Time.now + 60 * 60 * 24 * 7
  three_days = Time.now + 60 * 60 * 24 * 3

  2.times do
    random_datetime = rand(now..three_days).round.to_s
    random_dotw = random_datetime[0..9]
  
    Flight.create(departure_airport_id: start_id,
                  arrival_airport_id: finish_id,
                  start_time: random_datetime,
                  flight_date: random_dotw,
                  flight_duration: length)
  end
end

# Honolulu/Narita
make_flights(hnl.id, nrt.id, 7 * 60)
make_flights(nrt.id, hnl.id, 9 * 60)

# Honolulu/Haneda
make_flights(hnl.id, hnd.id, 7 * 60)
make_flights(hnd.id, hnl.id, 9 * 60)

# Honolulu/Fukuoka
make_flights(hnl.id, fuk.id, 9 * 60)
make_flights(fuk.id, hnl.id, 11 * 60)

#Fukuoka/Haneda
make_flights(fuk.id, hnd.id, 140)
make_flights(hnd.id, fuk.id, 140)

#Fukuoka/Narita
make_flights(fuk.id, nrt.id, 140)
make_flights(nrt.id, fuk.id, 140)

puts "Seeding done. #{hnl.id}"

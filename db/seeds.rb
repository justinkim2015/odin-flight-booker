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
lax = Airport.create(airport_code: 'LAX')
bkk = Airport.create(airport_code: 'BKK')
fuk = Airport.create(airport_code: 'FUK')

now = Time.now
one_year_later = Time.now + 60 * 60 * 24 * 365
random_time = rand(now..one_year_later)
airports = [hnl, hnd, nrt, lax, bkk, fuk]

def random_airport(arr)
  arr.sample
end

10.times do
  Flight.create(departure_airport_id: random_airport(airports).id, arrival_airport_id: random_airport(airports).id, start_time: random_time, flight_duration: rand(100..600))
end

puts "Seeding done. #{hnl.id}"

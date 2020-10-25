require 'faker'

Reservation.destroy_all
Listing.destroy_all
User.destroy_all
City.destroy_all

cities = Array.new
users = Array.new
listings = Array.new
reservations = Array.new

10.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Number.number(digits: 5))
end
puts "10 Cities créées"

20.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: "06#{Faker::Number.leading_zero_number(digits: 8)}", description: Faker::Lorem.sentence(word_count: 6), city: City.all.sample)
end
puts "20 Users créés"

50.times do
  listing = Listing.create(owner: User.all.sample, available_beds: Faker::Number.between(from: 1, to: 5), price: Faker::Number.within(range: 50..200), description: Faker::Lorem.sentence(word_count: 20), has_wifi: Faker::Boolean.boolean, , city: City.all.sample, welcome_message: Faker::Lorem.sentence(word_count: 5))
end
puts "50 Listings créés"

50.times do
  reservation = Reservation.create(guest: User.all.sample, listing: Listing.all.sample, start_date: Faker::Date.between(from: '2020-11-01', to: '2020-11-30') , end_date: Faker::Date.between(from: '2020-11-01', to: '2020-11-30'))
end
puts "10 Reservations créées"

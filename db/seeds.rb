# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Listing.destroy_all
User.destroy_all
City.destroy_all

cities = Array.new
users = Array.new
listings = Array.new

10.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  cities << city
end
puts "10 Cities créées"

20.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone_in_e164, description: Faker::Lorem.sentence(word_count: 6), city: cities.sample)
  users << user
end
puts "20 Users créés"

50.times do
  listing = Listing.create(available_beds: Faker::Number.between(from: 1, to: 5), price: Faker::Number.within(range: 50..200), description: Faker::Lorem.sentence(word_count: 10), has_wifi: Faker::Boolean.boolean, welcome_message: Faker::Lorem.sentence(word_count: 5), city: cities.sample)
  listings << listing
end
puts "50 Listings créés"

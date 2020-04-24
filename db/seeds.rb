# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flat.destroy_all

20.times do
  flat = Flat.new(
    name: Faker::Commerce.product_name,
    address: Faker::Address.full_address,
    description: Faker::Restaurant.description,
    price_per_night: rand(50..400),
    number_of_guests: rand(1..12)
  )
  flat.save
  puts "Flat #{flat.id} created"
end

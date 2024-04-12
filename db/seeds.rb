# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "seeding"
admin = User.create( email: "superadmin@example.com", firstname: "superadmin", lastname:"superadmin", password:"superadmin123", password_confirmation:"superadmin123", role:1, email_confirmed: true)
image_url =  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1uXhen7w1tKNLJFgEnT-eljsUgRqu2OvvkHLy4pzkTQ&s"
admin.avatar.attach(io: URI.open(image_url), filename: "avatar_#{admin.id}.jpg")
puts "admin #{admin.id}: #{admin.email} - Avatar attached"
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name}.#{last_name}", separators: '.')
  password = Faker::Internet.password(min_length: 8)
  random_address = Faker::Address.full_address
  user = User.create!(
    email: email,
    firstname: first_name,
    lastname: last_name,
    password: password,
    password_confirmation: password,
    adress: random_address,
    role: 0,
    email_confirmed: true
  )

  # Generate a random image URL using Faker's Avatar module
  image_url = Faker::Avatar.image(slug: user.email, size: "175x175", format: "jpg")

  # Download the image and attach it to the user's avatar
  user.avatar.attach(io: URI.open(image_url), filename: "avatar_#{user.id}.jpg")

  puts "User #{user.id}: #{user.email} - Avatar attached"
end
Motif.create(reason: "Maladie")
Motif.create(reason: "Congé Personelle")
Motif.create(reason: "RTT")
Motif.create(reason: "évenement")
puts "seeding done"
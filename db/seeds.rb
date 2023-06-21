# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = User.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

puts "seeding"
User.create(email: "admin@gmail.com", password: "123456",password_confirmation: "123456", role:1, email_confirmed: true  )
puts "seed done"
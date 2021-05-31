# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do |n|
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(
               email: email,
               password:              password,
               password_confirmation: password)
end

email = "admin@gmail.com"
password = "password"
User.create!(
             email: email,
             password:              password,
             password_confirmation: password,
             role: 1)

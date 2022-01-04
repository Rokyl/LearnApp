# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name:  "Example User",
             email: "example@ex.com",
             password:              "foobar",
             password_confirmation: "foobar",
             role: 1)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.word
  content = Faker::Lorem.sentence
  users.each { |user| user.ads.create!(content: content, title: title) }
end
User.create!(name:  "Rokyl",
             email: "s123@ex.com",
             password:              "foobar",
             password_confirmation: "foobar"
             )

user = User.last
title = "To Accept"
content = Faker::Lorem.sentence
user.ads.create!(content: content, title: title, status: "pending")
title = "To Decline"
content = Faker::Lorem.sentence
user.ads.create!(content: content, title: title, status: "pending")
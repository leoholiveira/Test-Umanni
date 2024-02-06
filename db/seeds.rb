# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
User.create(
  fullname: "Administrator",
  user_type: 'admin',
  email: 'admin@admin.com',
  avatar_image: Faker::LoremFlickr.image,
  password: '123456',
  password_confirmation: '123456'
)

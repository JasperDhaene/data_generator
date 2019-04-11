# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts '-' * 50
puts 'Running data generator'
puts '-' * 50

5.times do
  rg = Random.new
  pets = %w[Dog Cat Mouse Horse]
  food = %w[milk water bread meat carrot grass]

  dietary_restrictions = {
      'Cat' => %w[milk water bread],
      'Dog' => %w[water  meat],
      'Mouse' => %w[water cheese],
      'Horse' => %w[carrot grass water]
  }

  amount_of_pets = rg.rand(4)

  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    birth_date: Faker::Date.birthday(15, 65),
    amount_of_pets: amount_of_pets
  )

  amount_of_pets.times do
    pet = Pet.new(
      name: Faker::Creature::Dog.name,
      type: pets[rg.rand(pets.length)],
      age_in_months: rg.rand(180),
      user: user
    )

    food_for_pet = dietary_restrictions[pet.type]
    pet.update(favorite_food: food_for_pet[rg.rand(food_for_pet.length)])
    pet.save!

  end

end
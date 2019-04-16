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
puts 'Please hold...'
puts '-' * 50

500.times do
  rg = Random.new
  pets = %w[Dog Cat Mouse Horse]
  foods = %w[Milk Water Bread Meat Carrot Grass]
  fridges = %w[AEG Siemens Whirlpool]
  size = %w[small big]
  color = %w[orange purple white]
  brand = %w[cheap expensive]

  dietary_restrictions = {
    'Cat' => %w[milk water bread],
    'Dog' => %w[water meat],
    'Mouse' => %w[water cheese],
    'Horse' => %w[carrot grass water]
  }

  amount_of_pets = rg.rand(pets.length)

  # Generate user
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    birth_date: Faker::Date.birthday(15, 65),
  )

  # Generate one or multiple pets for a user
  amount_of_pets.times do
    pet = user.pets.create(
      name: Faker::Creature::Dog.name,
      type: pets[rg.rand(pets.length)],
      age_in_months: rg.rand(1..180),
      user: user
    )

    food_for_pet = dietary_restrictions[pet.type]
    pet.favorite_food = food_for_pet[rg.rand(food_for_pet.length)]
    pet.save!
  end

  if user.birth_date < 18.years.ago
    # between 1-10 foods in there
    fridge = Fridge.create(
      brand: fridges[rg.rand(fridges.length)],
      # let's just assume nobody has a fridge that's more than 30 years old
      last_technical_check: Faker::Date.between(30.years.ago, Date.today),
      user: user
    )
    fridge.save!

    # put some food in that fridge cuz why would you have one if it's empty?!
    rg.rand(1..10).times do
      food = Food.new(
        brand: brand[rg.rand(brand.length)],
        type: foods[rg.rand(foods.length)],
        expiration_date: Faker::Date.forward(3),
        fridge: fridge
      )
      case food.type
      when 'milk'
        food.volume = rg.rand(0.5..1)
      when 'bread'
        food.size = size[rg.rand(size.length)]
      when 'carrot'
        food.color = color[rg.rand(color.length)]
      end
      food.save
    end

  end
end

puts '-' * 50
puts 'OK DONE'
puts '-' * 50
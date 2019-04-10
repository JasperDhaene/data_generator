class Pet < ApplicationRecord
  validates :age_in_months, presence: true, inclusion: { in: 1..180 }
  belongs_to :user
end

class Cat < Pet
  validates :favorite_food, inclusion: { in: %w(milk water bread) }
end

class Dog < Pet
  validates :favorite_food, inclusion: { in: %w(water meat) }
end

class Mouse < Pet
  validates :favorite_food, inclusion: { in: %w(water cheese) }

end

class Horse < Pet
  validates :favorite_food, inclusion: { in: %w(carrot grass water) }
end

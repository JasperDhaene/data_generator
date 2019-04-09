class User < ApplicationRecord
  #- first name
  #- last name
  #- email
  #- date of birth
  #- pet animals (0-3 - random): counter_cache
  has_one :pet
  has_one :fridge

end
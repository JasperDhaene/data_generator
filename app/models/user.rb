class User < ApplicationRecord
  #- first name
  #- last name
  #- email
  #- date of birth
  #- pet animals (0-3 - random): counter_cache
  validates :first_name, :last_name, :email, :birth_date, presence: true

  has_many :pets, dependent: :destroy

  has_one :fridge, dependent: :destroy


end
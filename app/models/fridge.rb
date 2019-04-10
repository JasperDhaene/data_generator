class Fridge < ApplicationRecord
  validates :brand, inclusion: { in: %w(Siemens Whirlpool AEG) }
  # don't know how to validate size of food array

  belongs_to :user
end

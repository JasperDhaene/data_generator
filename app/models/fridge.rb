class Fridge < ApplicationRecord
  validates :brand, inclusion: { in: %w(Siemens Whirlpool AEG) }

  belongs_to :user
  has_many :foods
end
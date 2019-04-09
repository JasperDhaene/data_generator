class Fridge < ApplicationRecord
  validates :brand, inclusion: { in: %w( Siemens Whirlpool AEG ) }

end

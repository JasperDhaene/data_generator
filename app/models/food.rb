class Food < ApplicationRecord
  validates :brand, inclusion: { in: %w(cheap expensive ) }
  # BUG: brand can still be set for grass, where presence is set to false
  
  belongs_to :fridge
end

class Milk < Food
  validates :volume, presence: true, inclusion: { in: 0.5..1 }
end

class Water < Food
  validates :brand, :expiration_date, presence: false
end

class Bread < Food
  validates :size, presence: true, inclusion: { in: %w(small big) }
end

class Meat < Food

end

class Carrot < Food
 validates :color, presence: true, inclusion: { in: %w(orange purple white) }
end

class Grass < Food
  validates :brand, presence: false
  validates :expiration_date, presence: false
end

=begin
- Milk additionally has a volume: 0,5 / 1l - random
- Bread additionaly has a size: big / small - random
- Carrot additionaly has color: orange / purple / white - random
=end
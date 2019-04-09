class Pet < ApplicationRecord
  validates :age_in_months, presence: true, inclusion: { in: [1, 180] }
  belongs_to :user
end

class Cat < Pet

end

class Dog < Pet

end

class Mouse < Pet

end

class Horse < Pet

end

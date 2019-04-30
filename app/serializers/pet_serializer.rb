class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :age_in_months, :date_of_death, :favorite_food, :user_id
end
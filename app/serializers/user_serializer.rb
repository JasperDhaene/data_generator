class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :birth_date, :pets_count, :fridge
end
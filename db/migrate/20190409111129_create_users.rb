class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.date :birth_date, null: false
      t.integer :pet_type
      t.string :fridge_type

      t.timestamps
    end
  end
end

=begin
- first name
- last name
- email
- date of birth
- pet animals (0-3 - random): counter_cache

users over 18yo have a fridge with 1-10 (random) items of food in it (can have same item multiple times)
=end
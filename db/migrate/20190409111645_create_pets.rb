class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.integer :age_in_months
      t.date :date_of_death
      t.string :favorite_food, array: true, null: false

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

=begin
- Pet animals types:
    - Cat
    - Dog
    - Mouse
    - Horse
- Every animal has following info:
    - Age (1 month to 15 years - random)
    - date of death
    - Name
    - favorite food (1 or more - random)
=end

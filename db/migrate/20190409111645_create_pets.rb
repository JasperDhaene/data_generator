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

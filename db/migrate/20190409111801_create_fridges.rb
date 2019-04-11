class CreateFridges < ActiveRecord::Migration[5.2]
  def change
    create_table :fridges do |t|
      t.string :brand
      t.date :last_technical_check

      # initially set a 'null: false' here, but dunno how that interacts with 'belongs_to' and 'has_many' relationships
      # and sqlite3 doesn't have arrays, so that's another thing i'm not sure about
      t.string :food, array: true

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

=begin
- type: Siemens or Whirpool or AEG - random
- last technical check (date)
=end

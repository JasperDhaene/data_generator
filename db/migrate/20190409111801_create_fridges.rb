class CreateFridges < ActiveRecord::Migration[5.2]
  def change
    create_table :fridges do |t|
      t.string :brand
      t.date :last_technical_check
      t.string :food, array: true, null: false

      t.timestamps
    end
  end
end

=begin
- type: Siemens or Whirpool or AEG - random
- last technical check (date)
=end

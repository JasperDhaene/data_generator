class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :type, null: false

      t.date :expiration_date
      t.string :brand

      t.float :volume
      t.string :size
      t.string :color

      t.references :pet, foreign_key: true
      t.timestamps
    end
  end
end

=begin
- Milk additionally has a volume: 0,5 / 1l - random
- Bread additionaly has a size: big / small - random
- Carrot additionaly has color: orange / purple / white - random
=end
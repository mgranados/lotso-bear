class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :prevaluation_id
      t.integer :generic_car_id
      t.integer :warehouse_id
      t.string :color
      t.integer :door_number
      t.string :serie
      t.string :motor
      t.string :license_plates
      t.text :inventory_description
      t.text :special_equipment
      t.string :economic_number

      t.timestamps
    end
  end
end

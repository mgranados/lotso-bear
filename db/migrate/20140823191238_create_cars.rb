class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :genericCar_id
      t.integer :insured_id
      t.integer :warehouse_id
      t.string :carColor
      t.integer :carDoorNumber
      t.string :carSerie
      t.string :carMotor
      t.string :carLicensePlates
      t.text :carInventoryDescription
      t.string :carTaxiNumber
      t.text :carSpecialEquipment

      t.timestamps
    end
  end
end

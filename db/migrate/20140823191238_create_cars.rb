class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :idGenericCar
      t.integer :idInsured
      t.integer :idWarehouse
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

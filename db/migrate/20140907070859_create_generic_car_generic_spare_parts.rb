class CreateGenericCarGenericSpareParts < ActiveRecord::Migration
  def change
    create_table :generic_car_generic_spare_parts do |t|
      t.integer :genericCar_id
      t.integer :genericSparePart_id

      t.timestamps
    end
  end
end

class CreateCarSpareParts < ActiveRecord::Migration
  def change
    create_table :car_spare_parts do |t|
      t.integer :idCar
      t.integer :idSparePart

      t.timestamps
    end
  end
end

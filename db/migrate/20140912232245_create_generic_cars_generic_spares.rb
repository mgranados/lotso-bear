class CreateGenericCarsGenericSpares < ActiveRecord::Migration
  def change
    create_table :generic_cars_generic_spares do |t|
      t.integer :generic_car_id
      t.integer :generic_spare_id

      t.timestamps
    end
  end
end

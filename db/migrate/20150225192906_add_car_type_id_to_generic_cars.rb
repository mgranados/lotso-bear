class AddCarTypeIdToGenericCars < ActiveRecord::Migration
  def change
    add_column :generic_cars, :car_type_id, :integer
  end
end

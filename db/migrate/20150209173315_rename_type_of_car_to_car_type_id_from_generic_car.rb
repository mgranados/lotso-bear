class RenameTypeOfCarToCarTypeIdFromGenericCar < ActiveRecord::Migration
  def change
    rename_column :generic_cars, :type_of_car, :car_type_id
  end
end

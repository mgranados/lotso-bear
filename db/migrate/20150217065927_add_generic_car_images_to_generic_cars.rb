class AddGenericCarImagesToGenericCars < ActiveRecord::Migration
  def change
    add_column :generic_cars, :generic_car_images, :string, array: true, default: '{}'
  end
end

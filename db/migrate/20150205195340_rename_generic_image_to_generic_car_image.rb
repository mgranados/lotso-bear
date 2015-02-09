class RenameGenericImageToGenericCarImage < ActiveRecord::Migration
  def change
    rename_table :generic_images, :generic_car_images
    rename_column :generic_car_images, :generic_id, :generic_car_id
  end
end

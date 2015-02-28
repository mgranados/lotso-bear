class RemoveColumnsBrandIdModelFromGenericCar < ActiveRecord::Migration
  def change
    remove_column :generic_cars, :brand_id
    remove_column :generic_cars, :model
  end
end

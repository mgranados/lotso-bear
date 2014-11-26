class AddGenToGenericCars < ActiveRecord::Migration
  def change
    add_column :generic_cars, :gen, :boolean
  end
end

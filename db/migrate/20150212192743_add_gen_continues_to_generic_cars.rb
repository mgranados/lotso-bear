class AddGenContinuesToGenericCars < ActiveRecord::Migration
  def change
    add_column :generic_cars, :gen_continues, :boolean
  end
end

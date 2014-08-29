class CreateGenericCars < ActiveRecord::Migration
  def change
    create_table :generic_cars do |t|
      t.string :genericCarBrand
      t.string :genericCarType
      t.integer :genericCarYear
      t.string :genericCarGeneration
      t.string :genericCarModel

      t.timestamps
    end
  end
end

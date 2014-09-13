class CreateGenericCars < ActiveRecord::Migration
  def change
    create_table :generic_cars do |t|
      t.string :brand
      t.string :type
      t.integer :year
      t.string :generation
      t.string :model

      t.timestamps
    end
  end
end

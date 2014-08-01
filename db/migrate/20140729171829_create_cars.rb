class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :idBrand
      t.string :carType
      t.string :year
      t.string :generation
      t.string :model
      t.timestamps
    end
  end
end

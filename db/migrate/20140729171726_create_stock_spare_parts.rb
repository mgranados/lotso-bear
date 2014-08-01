class CreateStockSpareParts < ActiveRecord::Migration
  def change
    create_table :stock_spare_parts do |t|
      t.string :status
      t.integer :idWarehouse
      t.integer :idWorkshopCar
      t.string :color
      t.integer :idSparePart
      
      t.timestamps
    end
  end
end

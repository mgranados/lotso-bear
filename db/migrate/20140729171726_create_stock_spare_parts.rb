class CreateStockSpareParts < ActiveRecord::Migration
  def change
    create_table :stock_spare_parts do |t|
      t.string :status
      t.integer :idWarehouse
      t.integer :idWorkshop
      t.string :color

      t.timestamps
    end
  end
end

class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :warehouseBranch
      t.string :warehouseLocation
      t.string :warehouseGeolocation

      t.timestamps
    end
  end
end

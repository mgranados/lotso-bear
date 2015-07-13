class AddWarehouseIdToShelves < ActiveRecord::Migration
  def change
    add_column :shelves, :warehouse_id, :integer
  end
end

class AddColumnSupplierIdToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :supplier_id, :integer
  end
end

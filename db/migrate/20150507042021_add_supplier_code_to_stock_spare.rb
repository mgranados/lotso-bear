class AddSupplierCodeToStockSpare < ActiveRecord::Migration
  def change
    add_column :stock_spares, :supplier_code, :string
  end
end

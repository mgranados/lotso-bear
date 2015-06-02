# -*- encoding : utf-8 -*-
class AddSupplierCodeToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :supplier_code, :integer
  end
end

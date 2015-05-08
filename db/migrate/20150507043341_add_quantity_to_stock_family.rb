class AddQuantityToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :quantity, :integer
  end
end

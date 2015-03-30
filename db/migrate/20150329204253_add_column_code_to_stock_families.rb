class AddColumnCodeToStockFamilies < ActiveRecord::Migration
  def change
    add_column :stock_families, :code, :string
  end
end

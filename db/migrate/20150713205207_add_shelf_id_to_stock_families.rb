class AddShelfIdToStockFamilies < ActiveRecord::Migration
  def change
    add_column :stock_families, :shelf_id, :integer
  end
end

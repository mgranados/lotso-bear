class AddShelfIdToStockSpares < ActiveRecord::Migration
  def change
    add_column :stock_spares, :shelf_id, :integer
  end
end

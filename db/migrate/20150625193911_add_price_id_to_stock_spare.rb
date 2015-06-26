class AddPriceIdToStockSpare < ActiveRecord::Migration
  def change
    add_column :stock_spares, :price_id, :integer
  end
end

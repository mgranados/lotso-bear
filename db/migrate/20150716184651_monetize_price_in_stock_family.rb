class MonetizePriceInStockFamily < ActiveRecord::Migration
  def change
    add_money :stock_families, :entrance_price, amount: { null: true, default: nil}
    add_money :stock_families, :departure_price, amount: { null: true, default: nil}
    remove_column :stock_families, :price_id
  end
end

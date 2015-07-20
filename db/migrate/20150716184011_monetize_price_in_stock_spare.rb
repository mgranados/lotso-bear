class MonetizePriceInStockSpare < ActiveRecord::Migration
  def change
    add_money :stock_spares, :entrance_price, amount: { null: true, default: nil}
    add_money :stock_spares, :departure_price, amount: { null: true, default: nil}
    remove_column :stock_spares, :price_id
  end
end

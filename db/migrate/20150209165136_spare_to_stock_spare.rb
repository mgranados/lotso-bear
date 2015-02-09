class SpareToStockSpare < ActiveRecord::Migration
  def change
    rename_table :spares, :stock_spares

  end
end

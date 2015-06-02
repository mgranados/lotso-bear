# -*- encoding : utf-8 -*-
class AddCarOrderToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :car_order_id, :integer
  end
end

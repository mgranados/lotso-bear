# -*- encoding : utf-8 -*-
class AddOrderIdToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :order_id, :integer
  end
end

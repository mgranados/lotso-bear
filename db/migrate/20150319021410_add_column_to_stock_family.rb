# -*- encoding : utf-8 -*-
class AddColumnToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :price_id, :integer
  end
end

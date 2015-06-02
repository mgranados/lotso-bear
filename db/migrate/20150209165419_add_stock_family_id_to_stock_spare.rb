# -*- encoding : utf-8 -*-
class AddStockFamilyIdToStockSpare < ActiveRecord::Migration
  def change
    add_column :stock_spares, :stock_family_id, :integer
  end
end

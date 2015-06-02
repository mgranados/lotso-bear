# -*- encoding : utf-8 -*-
class CreateStockFamilies < ActiveRecord::Migration
  def change
    create_table :stock_families do |t|
      t.integer :generic_family_id
      t.timestamps
    end
  end
end

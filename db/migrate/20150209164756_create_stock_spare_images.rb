# -*- encoding : utf-8 -*-
class CreateStockSpareImages < ActiveRecord::Migration
  def change
    create_table :stock_spare_images do |t|
      t.integer :stock_spare_id

      t.timestamps
    end
  end
end

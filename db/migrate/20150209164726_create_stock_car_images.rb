# -*- encoding : utf-8 -*-
class CreateStockCarImages < ActiveRecord::Migration
  def change
    create_table :stock_car_images do |t|
      t.integer :stock_car_id

      t.timestamps
    end
  end
end

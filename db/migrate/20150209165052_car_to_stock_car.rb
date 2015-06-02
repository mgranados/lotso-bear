# -*- encoding : utf-8 -*-
class CarToStockCar < ActiveRecord::Migration
  def change
    rename_table :cars, :stock_cars

  end
end

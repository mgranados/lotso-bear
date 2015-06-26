class AddCodeToStockCar < ActiveRecord::Migration
  def change
    add_column :stock_cars, :code, :string
  end
end

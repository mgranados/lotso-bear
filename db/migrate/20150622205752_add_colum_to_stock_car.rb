class AddColumToStockCar < ActiveRecord::Migration
  def change
    add_column :stock_cars, :status, :string
  end
end

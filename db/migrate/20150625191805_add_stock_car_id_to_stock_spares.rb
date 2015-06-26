class AddStockCarIdToStockSpares < ActiveRecord::Migration
  def change
    add_column :stock_spares, :stock_car_id, :integer
  end
end

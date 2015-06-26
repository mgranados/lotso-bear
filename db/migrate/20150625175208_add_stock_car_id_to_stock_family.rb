class AddStockCarIdToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :stock_car_id, :integer
  end
end

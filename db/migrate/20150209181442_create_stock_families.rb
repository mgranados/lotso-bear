class CreateStockFamilies < ActiveRecord::Migration
  def change
    create_table :stock_families do |t|

      t.timestamps
    end
  end
end

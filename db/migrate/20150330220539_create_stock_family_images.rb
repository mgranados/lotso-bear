class CreateStockFamilyImages < ActiveRecord::Migration
  def change
    create_table :stock_family_images do |t|

      t.timestamps
    end
  end
end

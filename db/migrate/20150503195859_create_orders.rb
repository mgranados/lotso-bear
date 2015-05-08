class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :entrance_date
      t.integer :warehouse_id

      t.timestamps
    end
  end
end

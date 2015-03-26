class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :entrance_date
      t.references :warehouse, index: true

      t.timestamps
    end
  end
end

class CreateOrderSuppliers < ActiveRecord::Migration
  def change
    create_table :order_suppliers do |t|
      t.integer :order_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end

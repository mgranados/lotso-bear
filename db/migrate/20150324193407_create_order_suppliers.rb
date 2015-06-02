# -*- encoding : utf-8 -*-
class CreateOrderSuppliers < ActiveRecord::Migration
  def change
  	if !table_exists? :order_suppliers
	    create_table :order_suppliers do |t|
	      t.integer :order_id
	      t.integer :supplier_id

	      t.timestamps
	    end
	end
  end
end

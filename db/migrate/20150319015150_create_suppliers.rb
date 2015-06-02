# -*- encoding : utf-8 -*-
class CreateSuppliers < ActiveRecord::Migration
  def change
  	if !table_exists? :suppliers
	    create_table :suppliers do |t|
	      t.string :name
	      t.string :supplier_type_id

	      t.timestamps
	    end
	end
  end
end

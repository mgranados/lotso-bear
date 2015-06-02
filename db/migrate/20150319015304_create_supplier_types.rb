# -*- encoding : utf-8 -*-
class CreateSupplierTypes < ActiveRecord::Migration
  def change
  	if !table_exists? :supplier_types
	    create_table :supplier_types do |t|
	      t.string :name

	      t.timestamps
	    end
	end
  end
end

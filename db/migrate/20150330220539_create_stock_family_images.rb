# -*- encoding : utf-8 -*-
class CreateStockFamilyImages < ActiveRecord::Migration
  def change
  	if !table_exists? :stock_family_images
	    create_table :stock_family_images do |t|
			t.timestamps
  		end
    end
  end
end

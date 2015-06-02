# -*- encoding : utf-8 -*-
class CreatePrices < ActiveRecord::Migration
  def change
  	if !table_exists? :prices
	    create_table :prices do |t|
	      t.string :entrance
	      t.string :departure
	      t.timestamps
	    end
    end
  end
end

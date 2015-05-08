class DestroyOrderScaffoldOrder < ActiveRecord::Migration
	# In order to scaffold de basic order views, Im destroying the table to later run "rails g scaffold order"
  def change
  	if table_exists? :orders
  		drop_table :orders
  	end
  end
end

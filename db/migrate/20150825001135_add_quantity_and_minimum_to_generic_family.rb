class AddQuantityAndMinimumToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :minimum_quantity, :integer
    add_column :generic_families, :restock, :boolean
  end
end

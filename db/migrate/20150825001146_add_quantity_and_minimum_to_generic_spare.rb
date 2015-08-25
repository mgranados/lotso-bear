class AddQuantityAndMinimumToGenericSpare < ActiveRecord::Migration
  def change
    add_column :generic_spares, :minimum_quantity, :integer
    add_column :generic_spares, :restock, :boolean
  end
end

class AddColumnPriceidToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :price_id, :integer
  end
end

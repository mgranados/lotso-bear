class RemoveColumnPriceidFromGenericFamily < ActiveRecord::Migration
  def change
    remove_column :generic_families, :price_id, :integer
  end
end

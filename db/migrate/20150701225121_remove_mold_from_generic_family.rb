class RemoveMoldFromGenericFamily < ActiveRecord::Migration
  def change
    remove_column :generic_families, :mold, :boolean
  end
end

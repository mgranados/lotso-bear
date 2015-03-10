class AddMoldColumnToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :mold, :boolean
  end
end

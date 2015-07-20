class AddYearsToGenericFamilies < ActiveRecord::Migration
  def change
    add_column :generic_families, :years, :string
  end
end

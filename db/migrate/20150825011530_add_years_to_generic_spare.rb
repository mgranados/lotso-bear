class AddYearsToGenericSpare < ActiveRecord::Migration
  def change
    add_column :generic_spares, :years, :string
  end
end

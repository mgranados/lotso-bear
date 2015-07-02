class AddColumnLocationToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :location, :string
  end
end

class AddCodeToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :code, :string
  end
end

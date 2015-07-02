class AddColumsToSupplies < ActiveRecord::Migration
  def change
    add_column :supplies, :weight, :float
    add_column :supplies, :brand, :string
    add_column :supplies, :quantity, :integer
    add_column :supplies, :size, :string
    add_column :supplies, :supplier_id, :integer
  end
end

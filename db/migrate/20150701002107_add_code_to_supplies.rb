class AddCodeToSupplies < ActiveRecord::Migration
  def change
    add_column :supplies, :code, :string
  end
end

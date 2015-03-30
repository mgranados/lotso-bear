class AddColumnStatusToStockFamilies < ActiveRecord::Migration
  def change
    add_column :stock_families, :status, :string
  end
end

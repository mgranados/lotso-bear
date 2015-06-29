class AddColorToStockFamilies < ActiveRecord::Migration
  def change
    add_column :stock_families, :color, :string
  end
end

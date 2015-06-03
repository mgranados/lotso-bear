class AddSubsectionIdToStockFamily < ActiveRecord::Migration
  def change
    add_column :stock_families, :subsection_id, :integer
  end
end

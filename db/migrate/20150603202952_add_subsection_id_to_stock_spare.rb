class AddSubsectionIdToStockSpare < ActiveRecord::Migration
  def change
    add_column :stock_spares, :subsection_id, :integer
  end
end

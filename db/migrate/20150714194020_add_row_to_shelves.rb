class AddRowToShelves < ActiveRecord::Migration
  def change
    add_column :shelves, :row, :integer
  end
end

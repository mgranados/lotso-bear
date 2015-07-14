class RemoveRowFromShelves < ActiveRecord::Migration
  def change
    remove_column :shelves, :row, :string
  end
end

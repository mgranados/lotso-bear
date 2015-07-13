class AddCodeToShelves < ActiveRecord::Migration
  def change
    add_column :shelves, :code, :string
  end
end

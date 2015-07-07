class AddQuantityToSpendings < ActiveRecord::Migration
  def change
    add_column :spendings, :quantity, :integer
  end
end

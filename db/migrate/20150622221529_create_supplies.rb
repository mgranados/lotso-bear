class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.integer :minimum_qty
      t.integer :cost
      t.string :description

      t.timestamps
    end
  end
end

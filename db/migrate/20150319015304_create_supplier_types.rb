class CreateSupplierTypes < ActiveRecord::Migration
  def change
    create_table :supplier_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

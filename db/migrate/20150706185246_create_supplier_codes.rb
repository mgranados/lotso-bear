class CreateSupplierCodes < ActiveRecord::Migration
  def change
    create_table :supplier_codes do |t|
      t.integer :generic_family_id
      t.integer :supplier_id
      t.string :code

      t.timestamps
    end
  end
end

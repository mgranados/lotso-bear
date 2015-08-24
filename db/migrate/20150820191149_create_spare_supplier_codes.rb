class CreateSpareSupplierCodes < ActiveRecord::Migration
  def change
    create_table :spare_supplier_codes do |t|
      t.integer :generic_spare_id
      t.integer :supplier_id
      t.string :code
      t.integer :price_centavos

      t.timestamps
    end
  end
end

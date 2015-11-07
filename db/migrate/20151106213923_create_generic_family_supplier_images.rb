class CreateGenericFamilySupplierImages < ActiveRecord::Migration
  def change
    create_table :generic_family_supplier_images do |t|
      t.integer :supplier_code_id

      t.timestamps
    end
  end
end

class CreateSupplierLikelihoods < ActiveRecord::Migration
  def change
    create_table :supplier_likelihoods do |t|
      t.integer :supplier_id
      t.integer :generic_family_id

      t.timestamps
    end
  end
end

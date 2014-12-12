class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :generic_spare_id
      t.integer :child_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end

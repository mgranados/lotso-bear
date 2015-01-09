class CreateGenericSpareFamilies < ActiveRecord::Migration
  def change
    create_table :generic_spare_families do |t|
      t.integer :generic_spare_id
      t.integer :child_id

      t.timestamps
    end
  end
end

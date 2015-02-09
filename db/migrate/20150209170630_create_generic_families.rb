class CreateGenericFamilies < ActiveRecord::Migration
  def change
    create_table :generic_families do |t|
      t.integer :generic_spare_id
      t.text :description

      t.timestamps
    end
  end
end

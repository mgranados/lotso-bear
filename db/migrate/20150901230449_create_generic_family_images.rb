class CreateGenericFamilyImages < ActiveRecord::Migration
  def change
    create_table :generic_family_images do |t|
      t.integer :generic_family_id

      t.timestamps
    end
  end
end

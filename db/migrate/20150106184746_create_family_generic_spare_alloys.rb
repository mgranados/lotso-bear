class CreateFamilyGenericSpareAlloys < ActiveRecord::Migration
  def change
    create_table :family_generic_spare_alloys do |t|
      t.integer :family_id
      t.integer :generic_spare_id

      t.timestamps
    end
  end
end

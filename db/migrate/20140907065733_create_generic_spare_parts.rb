class CreateGenericSpareParts < ActiveRecord::Migration
  def change
    create_table :generic_spare_parts do |t|
      t.string :genericSparePartBrand
      t.string :genericSparePartType
      t.string :genericSparePartName
      t.string :genericSparePartCarRegion
      t.text :genericSparePartDescription

      t.timestamps
    end
  end
end

class CreateSparePartTypes < ActiveRecord::Migration
  def change
    create_table :spare_part_types do |t|
      t.string :sparePartTypeName
      t.text :sparePartTypeDescription

      t.timestamps
    end
  end
end

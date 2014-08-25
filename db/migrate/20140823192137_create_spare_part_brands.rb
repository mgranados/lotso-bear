class CreateSparePartBrands < ActiveRecord::Migration
  def change
    create_table :spare_part_brands do |t|
      t.string :sparePartBrandName

      t.timestamps
    end
  end
end

class CreateSpareParts < ActiveRecord::Migration
  def change
    create_table :spare_parts do |t|
      t.integer :idWareHouse
      t.integer :idSparePartBrand
      t.integer :idSparePartType
      t.integer :idSparePartGroup
      t.integer :idSparePartStatus
      t.integer :idCar
      t.string :sparePartName
      t.text :sparePartDescription
      t.string :sparePartCarRegion
      t.string :sparePartCode
      t.string :sparePartColor
      t.integer :idGenericCar

      t.timestamps
    end
  end
end

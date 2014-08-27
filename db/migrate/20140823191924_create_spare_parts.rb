class CreateSpareParts < ActiveRecord::Migration
  def change
    create_table :spare_parts do |t|
      t.integer :car_id
      t.integer :wareHouse_id
      t.integer :genericCar_id
      t.integer :sparePartGroup_id
      t.integer :sparePartBrand
      t.integer :sparePartType
      t.integer :sparePartStatus
      t.string  :sparePartName
      t.text    :sparePartDescription
      t.string  :sparePartCarRegion
      t.string  :sparePartCode
      t.string  :sparePartColor

      t.timestamps
    end
  end
end

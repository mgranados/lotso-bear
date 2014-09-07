class CreateSpareParts < ActiveRecord::Migration
  def change
    create_table :spare_parts do |t|
      t.integer :car_id
      t.integer :wareHouse_id
      t.integer :sparePartStatus
      t.text    :sparePartDescription
      t.string  :sparePartCode
      t.string  :sparePartColor

      t.timestamps
    end
  end
end

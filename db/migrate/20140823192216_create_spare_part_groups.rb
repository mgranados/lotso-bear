class CreateSparePartGroups < ActiveRecord::Migration
  def change
    create_table :spare_part_groups do |t|
      t.text :sparePartGroupDescription
      t.string :sparePartGroupName

      t.timestamps
    end
  end
end

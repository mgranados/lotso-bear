class CreateSparePartStatuses < ActiveRecord::Migration
  def change
    create_table :spare_part_statuses do |t|
      t.string :sparePartStatus

      t.timestamps
    end
  end
end

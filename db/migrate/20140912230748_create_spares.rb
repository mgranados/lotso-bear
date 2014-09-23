class CreateSpares < ActiveRecord::Migration
  def change
    create_table :spares do |t|
      t.integer :car_id
      t.integer :warehouse_id
      t.integer :spare_id
      t.string :status
      t.text :description
      t.string :code
      t.string :color

      t.timestamps
    end
  end
end

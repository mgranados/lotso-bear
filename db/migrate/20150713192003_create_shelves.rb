class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :aisle
      t.string :row
      t.integer :level
      t.integer :number

      t.timestamps
    end
  end
end

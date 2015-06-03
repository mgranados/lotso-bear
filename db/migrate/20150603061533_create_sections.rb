class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :code
      t.integer :warehouse_id
      t.string :name

      t.timestamps
    end
  end
end

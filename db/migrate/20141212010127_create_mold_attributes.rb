class CreateMoldAttributes < ActiveRecord::Migration
  def change
    create_table :mold_attributes do |t|
      t.integer :mold_spare_id
      t.string :name

      t.timestamps
    end
  end
end

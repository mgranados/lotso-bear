class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.integer :number_of_doors

      t.timestamps
    end
  end
end

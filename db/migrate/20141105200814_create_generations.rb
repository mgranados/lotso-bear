class CreateGenerations < ActiveRecord::Migration
  def change
    create_table :generations do |t|
      t.integer :year

      t.timestamps
    end
  end
end

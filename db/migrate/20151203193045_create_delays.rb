class CreateDelays < ActiveRecord::Migration
  def change
    create_table :delays do |t|
      t.integer :year
      t.integer :month
      t.decimal :minutes_late

      t.timestamps
    end
  end
end

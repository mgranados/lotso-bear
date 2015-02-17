class CreateCarTypes < ActiveRecord::Migration
  def change
    create_table :car_types do |t|
      t.string :name
      t.string :doors

      t.timestamps
    end
  end
end

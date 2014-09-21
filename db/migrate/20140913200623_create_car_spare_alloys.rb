class CreateCarSpareAlloys < ActiveRecord::Migration
  def change
    create_table :car_spare_alloys do |t|
    t.integer :generic_car_id
    t.integer :generic_spare_id
    t.string  :relation

      t.timestamps
    end
  end
end

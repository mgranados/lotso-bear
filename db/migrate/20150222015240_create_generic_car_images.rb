class CreateGenericCarImages < ActiveRecord::Migration
  def change
    create_table :generic_car_images do |t|
      t.integer :generic_car_id

      t.timestamps
    end
  end
end

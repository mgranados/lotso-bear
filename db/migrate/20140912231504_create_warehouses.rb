class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :branch
      t.string :location
      t.string :geolocation

      t.timestamps
    end
  end
end

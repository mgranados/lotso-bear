class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :branch
      t.string :location
      t.string :geoLocation

      t.timestamps
    end
  end
end

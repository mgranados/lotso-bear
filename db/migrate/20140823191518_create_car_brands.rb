class CreateCarBrands < ActiveRecord::Migration
  def change
    create_table :car_brands do |t|
      t.string :carBrandName

      t.timestamps
    end
  end
end

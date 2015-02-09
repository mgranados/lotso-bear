class CreateGenericSpareImages < ActiveRecord::Migration
  def change
    create_table :generic_spare_images do |t|
      t.string :generic_spare_id

      t.timestamps
    end
  end
end

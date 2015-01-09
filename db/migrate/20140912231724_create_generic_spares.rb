class CreateGenericSpares < ActiveRecord::Migration
  def change
    create_table :generic_spares do |t|
      t.string :brand
      t.string :type_of_spare
      t.string :name
      t.string :region
      t.text :description
      t.integer :family_id

      t.timestamps
    end
  end
end

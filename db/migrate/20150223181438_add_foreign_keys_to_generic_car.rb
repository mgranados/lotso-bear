class AddForeignKeysToGenericCar < ActiveRecord::Migration
  def change
    add_column :generic_cars, :model_acronym_id, :integer
  end
end

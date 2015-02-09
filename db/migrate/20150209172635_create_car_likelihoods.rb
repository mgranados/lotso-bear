class CreateCarLikelihoods < ActiveRecord::Migration
  def change
    create_table :car_likelihoods do |t|
      t.integer :car_type_id
      t.string :generic_car_id

      t.timestamps
    end
  end
end

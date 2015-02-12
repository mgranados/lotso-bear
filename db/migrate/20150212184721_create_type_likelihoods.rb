class CreateTypeLikelihoods < ActiveRecord::Migration
  def change
    create_table :type_likelihoods do |t|
      t.integer :generic_car
      t.integer :car_type

      t.timestamps
    end
  end
end

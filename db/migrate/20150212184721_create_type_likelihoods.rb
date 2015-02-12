class CreateTypeLikelihoods < ActiveRecord::Migration
  def change
    create_table :type_likelihoods do |t|
      t.id :generic_car
      t.id :car_type

      t.timestamps
    end
  end
end

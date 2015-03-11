class CreateFamilyLikelihood < ActiveRecord::Migration
  def change
    create_table :family_likelihoods do |t|
      t.integer :generic_car_id
      t.integer :generic_family_id
      t.string :years
    end
  end
end

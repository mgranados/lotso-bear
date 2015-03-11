class CreateFamilyLikelihood < ActiveRecord::Migration
  def change
    if !table_exists? :family_likelihoods
      create_table :family_likelihoods do |t|
        t.integer :generic_car_id
        t.integer :generic_family_id
        t.string :years
      end
    end
  end
end

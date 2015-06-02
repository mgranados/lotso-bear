# -*- encoding : utf-8 -*-
class CreateGenericCarGenerations < ActiveRecord::Migration
  def change
    create_table :generic_car_generations do |t|
      t.integer :car_likelihood_id
      t.integer :generation_id

      t.timestamps
    end
  end
end

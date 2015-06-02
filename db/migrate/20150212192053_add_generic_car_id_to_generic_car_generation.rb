# -*- encoding : utf-8 -*-
class AddGenericCarIdToGenericCarGeneration < ActiveRecord::Migration
  def change
    add_column :generic_car_generations, :generic_car_id, :integer
  end
end

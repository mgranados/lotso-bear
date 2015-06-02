# -*- encoding : utf-8 -*-
class RemoveCarLikelihoodIdFromGenericCarGeneration < ActiveRecord::Migration
  def change
    remove_column :generic_car_generations, :car_likelihood_id, :integer
  end
end

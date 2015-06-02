# -*- encoding : utf-8 -*-
class RenameLikelihoodToSpareLikelihood < ActiveRecord::Migration
  def change
    rename_table :likelihoods, :spare_likelihoods
  end
end

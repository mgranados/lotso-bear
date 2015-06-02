# -*- encoding : utf-8 -*-
class ColumnYearsToTypeLikelihoods < ActiveRecord::Migration
  def change
    add_column :type_likelihoods, :years, :string
  end
end

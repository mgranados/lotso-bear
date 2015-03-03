class ColumnActiveToTypeLikelihoods < ActiveRecord::Migration
  def change
    add_column :type_likelihoods, :active, :boolean
  end
end

class RemoveColumnRelationsFromGenericFittable < ActiveRecord::Migration
  def change
    remove_column :generic_fittables , :relation
  end
end

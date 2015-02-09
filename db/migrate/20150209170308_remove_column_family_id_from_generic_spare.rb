class RemoveColumnFamilyIdFromGenericSpare < ActiveRecord::Migration
  def change
    remove_column :generic_spares , :family_id
  end
end

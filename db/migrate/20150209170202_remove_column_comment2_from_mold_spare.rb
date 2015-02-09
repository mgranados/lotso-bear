class RemoveColumnComment2FromMoldSpare < ActiveRecord::Migration
  def change
    remove_column :mold_spares , :comment2
  end
end

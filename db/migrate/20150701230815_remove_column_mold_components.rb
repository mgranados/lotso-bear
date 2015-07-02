class RemoveColumnMoldComponents < ActiveRecord::Migration
  def change
    drop_table :mold_components
  end
end

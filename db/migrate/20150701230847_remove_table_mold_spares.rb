class RemoveTableMoldSpares < ActiveRecord::Migration
  def change
    drop_table :mold_spares
  end
end

class RenameCarSpareAlloyToGenericFittable < ActiveRecord::Migration
  def change
    rename_table :car_spare_alloys, :generic_fittables
  end
end

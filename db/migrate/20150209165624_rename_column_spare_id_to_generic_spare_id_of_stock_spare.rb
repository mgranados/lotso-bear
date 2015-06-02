# -*- encoding : utf-8 -*-
class RenameColumnSpareIdToGenericSpareIdOfStockSpare < ActiveRecord::Migration
  def change
    rename_column :stock_spares, :spare_id, :generic_spare_id

  end
end

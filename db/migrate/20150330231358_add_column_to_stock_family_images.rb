# -*- encoding : utf-8 -*-
class AddColumnToStockFamilyImages < ActiveRecord::Migration
  def change
    add_column :stock_family_images, :stock_family_id, :integer
  end
end

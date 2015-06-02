# -*- encoding : utf-8 -*-
class AddColumnActiveToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :active, :boolean
  end
end

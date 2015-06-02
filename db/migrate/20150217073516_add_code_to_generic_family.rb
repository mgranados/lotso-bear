# -*- encoding : utf-8 -*-
class AddCodeToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :code, :string
  end
end

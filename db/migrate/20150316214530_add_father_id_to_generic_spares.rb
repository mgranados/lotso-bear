# -*- encoding : utf-8 -*-
class AddFatherIdToGenericSpares < ActiveRecord::Migration
  def change
    add_column :generic_spares, :father_id, :integer
  end
end

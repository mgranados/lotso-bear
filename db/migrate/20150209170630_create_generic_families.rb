# -*- encoding : utf-8 -*-
class CreateGenericFamilies < ActiveRecord::Migration
  def change
    create_table :generic_families do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

# -*- encoding : utf-8 -*-
class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :acronym

      t.timestamps
    end
  end
end

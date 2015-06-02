# -*- encoding : utf-8 -*-
class CreateMoldComponents < ActiveRecord::Migration
  def change
    create_table :mold_components do |t|
      t.string :name
      t.integer :mold_spare_id

      t.timestamps
    end
  end
end

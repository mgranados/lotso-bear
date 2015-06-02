# -*- encoding : utf-8 -*-
class CreateModelAcronyms < ActiveRecord::Migration
  def change
    create_table :model_acronyms do |t|
      t.integer :brand_id
      t.string :initials
      t.string :model
      t.timestamps
    end
  end
end

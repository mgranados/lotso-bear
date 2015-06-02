# -*- encoding : utf-8 -*-
class CreateTypeLikelihoods < ActiveRecord::Migration
  def change
    create_table :type_likelihoods do |t|
      t.integer :generic_family_id
      t.integer :car_type_id


      t.timestamps
    end
  end
end

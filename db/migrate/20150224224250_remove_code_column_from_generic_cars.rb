# -*- encoding : utf-8 -*-
class RemoveCodeColumnFromGenericCars < ActiveRecord::Migration
  def change
    remove_column :generic_cars, :code
  end
end

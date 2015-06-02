# -*- encoding : utf-8 -*-
class CreateValuations < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
      t.string :client_code
      t.string :edited_by

      t.timestamps
    end
  end
end

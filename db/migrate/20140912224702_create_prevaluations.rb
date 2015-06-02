# -*- encoding : utf-8 -*-
class CreatePrevaluations < ActiveRecord::Migration
  def change
    create_table :prevaluations do |t|
      t.string :number
      t.string :policy
      t.string :subsection
      t.date :expedition_date
      t.date :valuation_date
      t.float :deductible_value
      t.float :commercial_value
      t.boolean :requires_crane
      t.boolean :collection_status
      t.string :special_conditions
      t.boolean :third_insured
      t.string :agent_name
      t.text :comment

      t.timestamps
    end

  end
end

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

      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
      t.attachment :doc1
      t.attachment :doc2
      t.attachment :doc3
      t.attachment :doc4

      t.timestamps
    end

    def self.down
      remove_attachment :pre_valuations, :photo1
      remove_attachment :pre_valuations, :photo2
      remove_attachment :pre_valuations, :photo3
      remove_attachment :pre_valuations, :photo4
      remove_attachment :pre_valuations, :doc1
      remove_attachment :pre_valuations, :doc2
      remove_attachment :pre_valuations, :doc3
      remove_attachment :pre_valuations, :doc4
    end
  end
end

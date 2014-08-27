class CreatePreValuations < ActiveRecord::Migration
  def change
    create_table :pre_valuations do |t|
      t.integer :insured_id
      t.string :preValuationNumber
      t.string :preValuationPolicyNumber
      t.string :preValuationSubsection
      t.date :preValuationExpeditionDate
      t.date :preValuationDate
      t.float :preValuationDeductibleValue
      t.float :preValuationCommercialValue
      t.boolean :preValuationRequiresCrane
      t.boolean :preValuationCollectionStatus
      t.string :preValuationSpecialConditions
      t.boolean :preValuationThirdInsured
      t.string :preValuationAgentName
      t.text :preValuationComment

      t.timestamps
    end
  end
end

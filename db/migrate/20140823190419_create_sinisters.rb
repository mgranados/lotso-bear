class CreateSinisters < ActiveRecord::Migration
  def change
    create_table :sinisters do |t|
      t.integer :insured_id
      t.string :sinisterNumber
      t.string :sinisterPolicyNumber
      t.string :sinisterSubsection
      t.date :sinisterExpeditionDate
      t.date :sinisterDate
      t.float :sinisterDeductibleValue
      t.float :sinisterCommercialValue
      t.boolean :sinisterRequiresCrane
      t.boolean :sinisterCollectionStatus
      t.string :sinisterSpecialConditions
      t.boolean :sinisterThirdInsured
      t.string :sinisterAgentName
      t.text :sinisterComment

      t.timestamps
    end
  end
end

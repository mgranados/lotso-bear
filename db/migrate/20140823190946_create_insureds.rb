class CreateInsureds < ActiveRecord::Migration
  def change
    create_table :insureds do |t|
      t.integer :pre_valuation_id
      t.boolean :insuredIsThird
      t.string :insuredName
      t.integer :insuredTelephone
      t.string :insuredEmail

      t.timestamps
    end
  end
end

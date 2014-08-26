class CreateInsureds < ActiveRecord::Migration
  def change
    create_table :insureds do |t|
      t.integer :sinister_id
      t.boolean :insuredIsThird
      t.string :insuredName
      t.integer :insuredTelephone
      t.string :insuredMail

      t.timestamps
    end
  end
end

class CreateInsureds < ActiveRecord::Migration
  def change
    create_table :insureds do |t|
      t.integer :prevaluation_id
      t.boolean :third
      t.string :name
      t.integer :telephone
      t.string :email

      t.timestamps
    end
  end
end

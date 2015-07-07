class CreateSpendings < ActiveRecord::Migration
  def change

    create_table :spendings do |t|
      t.integer :user_id
      t.integer :supply_id

      t.timestamps
    end
    add_money :spendings, :cost
  end
end

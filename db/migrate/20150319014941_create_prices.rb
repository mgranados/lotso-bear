class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :entrance
      t.string :departure

      t.timestamps
    end
  end
end

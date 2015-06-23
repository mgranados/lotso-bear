class CreateFamilyHistories < ActiveRecord::Migration
  def change
    create_table :family_histories do |t|
      t.integer :stock_family_id
      t.string :description

      t.timestamps
    end
  end
end

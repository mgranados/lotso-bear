class CreateSpareHistories < ActiveRecord::Migration
  def change
    create_table :spare_histories do |t|
      t.integer :stock_spare_id
      t.string :description

      t.timestamps
    end
  end
end

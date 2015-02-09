class CreatePrevaluationImages < ActiveRecord::Migration
  def change
    create_table :prevaluation_images do |t|
      t.string :prevaluation_id

      t.timestamps
    end
  end
end

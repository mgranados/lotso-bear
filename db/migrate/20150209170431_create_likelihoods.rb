class CreateLikelihoods < ActiveRecord::Migration
  def change
    create_table :likelihoods do |t|
      t.integer :generic_spare_id
      t.integer :generic_family_id

      t.timestamps
    end
  end
end

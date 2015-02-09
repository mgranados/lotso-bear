class CreateFamilyAcronyms < ActiveRecord::Migration
  def change
    create_table :family_acronyms do |t|
      t.string :code
      t.integer :generic_family_id
      t.timestamps
    end
  end
end

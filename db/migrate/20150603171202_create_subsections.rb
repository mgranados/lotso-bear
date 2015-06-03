class CreateSubsections < ActiveRecord::Migration
  def change
    create_table :subsections do |t|
      t.string :code
      t.string :name
      t.integer :section_id

      t.timestamps
    end
  end
end

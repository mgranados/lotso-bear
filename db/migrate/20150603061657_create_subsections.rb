class CreateSubsections < ActiveRecord::Migration
  def change
    create_table :subsections do |t|
      t.string :code
      t.integer :section_id
      t.string :name

      t.timestamps
    end
  end
end

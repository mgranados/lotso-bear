class CreateMoldSpares < ActiveRecord::Migration
  def change
    create_table :mold_spares do |t|
      t.string :name
      t.string :comment
      t.string :comment2
      t.string :type

      t.timestamps
    end
  end
end

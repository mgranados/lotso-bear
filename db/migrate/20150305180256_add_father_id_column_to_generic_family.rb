class AddFatherIdColumnToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :father_id, :integer
  end
end

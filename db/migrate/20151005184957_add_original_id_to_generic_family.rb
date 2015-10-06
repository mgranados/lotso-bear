class AddOriginalIdToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :original_id, :integer
  end
end

class AddVariantCommentToGenericFamily < ActiveRecord::Migration
  def change
    add_column :generic_families, :variant_comment, :text
  end
end

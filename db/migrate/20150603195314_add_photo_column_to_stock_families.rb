class AddPhotoColumnToStockFamilies < ActiveRecord::Migration
  def up
    add_attachment :stock_families, :photo
  end

  def down
    remove_attachment :stock_families, :photo
  end

end

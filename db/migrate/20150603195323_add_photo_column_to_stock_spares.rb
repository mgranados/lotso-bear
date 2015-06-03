class AddPhotoColumnToStockSpares < ActiveRecord::Migration
  def up
    add_attachment :stock_spares, :photo
  end

  def down
    remove_attachment :stock_spares, :photo
  end

end

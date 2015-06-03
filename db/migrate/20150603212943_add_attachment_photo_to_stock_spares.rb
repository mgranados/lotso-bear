class AddAttachmentPhotoToStockSpares < ActiveRecord::Migration
  def self.up
    change_table :stock_spares do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :stock_spares, :photo
  end
end

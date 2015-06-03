class AddAttachmentPhotoToStockFamilies < ActiveRecord::Migration
  def self.up
    change_table :stock_families do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :stock_families, :photo
  end
end

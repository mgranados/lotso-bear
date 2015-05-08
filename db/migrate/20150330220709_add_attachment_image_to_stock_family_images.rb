class AddAttachmentImageToStockFamilyImages < ActiveRecord::Migration
  def self.up
	change_table :stock_family_images do |t|
	  t.attachment :image
	end
  end

  def self.down
    remove_attachment :stock_family_images, :image
  end
end

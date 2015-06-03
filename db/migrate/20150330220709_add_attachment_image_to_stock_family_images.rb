# -*- encoding : utf-8 -*-
class AddAttachmentImageToStockFamilyImages < ActiveRecord::Migration
  def self.up
  	if !table_exists? :image_file_name
		change_table :stock_family_images do |t|
		  t.attachment :image
		end
	end
  end

  def self.down
    remove_attachment :stock_family_images, :image
  end
end

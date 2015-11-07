class AddAttachmentImageToGenericFamilySupplierImages < ActiveRecord::Migration
  def self.up
    change_table :generic_family_supplier_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :generic_family_supplier_images, :image
  end
end

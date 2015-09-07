class AddAttachmentImageToGenericFamilyImages < ActiveRecord::Migration
  def self.up
    change_table :generic_family_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :generic_family_images, :image
  end
end

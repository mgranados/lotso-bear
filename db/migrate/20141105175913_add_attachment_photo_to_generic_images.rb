class AddAttachmentPhotoToGenericImages < ActiveRecord::Migration
  def self.up
    change_table :generic_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :generic_images, :photo
  end
end

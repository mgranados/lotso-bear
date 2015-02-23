class AddAttachmentImageToGenericCarImages < ActiveRecord::Migration
  def self.up
    change_table :generic_car_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :generic_car_images, :image
  end
end

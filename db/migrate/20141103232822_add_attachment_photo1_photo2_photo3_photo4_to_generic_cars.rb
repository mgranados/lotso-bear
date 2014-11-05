class AddAttachmentPhoto1Photo2Photo3Photo4ToGenericCars < ActiveRecord::Migration
  def self.up
    change_table :generic_cars do |t|
      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
    end
  end

  def self.down
    remove_attachment :generic_cars, :photo1
    remove_attachment :generic_cars, :photo2
    remove_attachment :generic_cars, :photo3
    remove_attachment :generic_cars, :photo4
  end
end

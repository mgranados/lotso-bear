class AddAttachmentPhoto1Photo2Photo3Photo4Doc1Doc2Doc3Doc4ToPreValuations < ActiveRecord::Migration
  def self.up
    change_table :pre_valuations do |t|
      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
      t.attachment :doc1
      t.attachment :doc2
      t.attachment :doc3
      t.attachment :doc4
    end
  end

  def self.down
    remove_attachment :pre_valuations, :photo1
    remove_attachment :pre_valuations, :photo2
    remove_attachment :pre_valuations, :photo3
    remove_attachment :pre_valuations, :photo4
    remove_attachment :pre_valuations, :doc1
    remove_attachment :pre_valuations, :doc2
    remove_attachment :pre_valuations, :doc3
    remove_attachment :pre_valuations, :doc4
  end
end

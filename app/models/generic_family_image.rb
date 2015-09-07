class GenericFamilyImage < ActiveRecord::Base
	belongs_to :generic_family, :class_name => "Generic_Family", :foreign_key => "generic_family_id"
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

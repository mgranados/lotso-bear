
class GenericFamilySupplierImage < ActiveRecord::Base
	belongs_to :supplier_code
	attr_reader :avatar_remote_url


	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  	def image_from_url(url_value)
    	self.image = URI.parse(url_value) unless url_value.blank?
        @avatar_remote_url = url_value
	end
end
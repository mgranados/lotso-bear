# -*- encoding : utf-8 -*-
class GenericCarImage < ActiveRecord::Base
	belongs_to :generic_car
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

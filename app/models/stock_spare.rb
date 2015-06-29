# -*- encoding : utf-8 -*-
class StockSpare < ActiveRecord::Base
  belongs_to :car
  belongs_to :warehouse
  belongs_to :generic_spare
  belongs_to :stock_family
  belongs_to :order
  belongs_to :subsection
  belongs_to :stock_car
  belongs_to :price

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_many :stock_spare_images
  has_many :spare_histories


  after_create :create_code

 def create_code
	car = GenericCar.find_by_id(self.stock_family.car_order_id)
	current_number =  StockSpare.where(generic_spare_id: self.generic_spare_id).count
	self.update(code: "#{car.code}#{self.generic_spare.code}#{current_number}")
 end
 
end

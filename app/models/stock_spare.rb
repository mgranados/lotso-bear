class StockSpare < ActiveRecord::Base
  belongs_to :car
  belongs_to :warehouse
  belongs_to :generic_spare
  belongs_to :stock_family
  belongs_to :order

  has_many :stock_spare_images

  after_create :create_code

 def create_code
	car = GenericCar.find_by_id(self.stock_family.car_order_id)
	self.update(code: "#{car.code}-#{self.generic_spare.code}-#{self.id}")
 end

end

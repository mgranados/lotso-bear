class WorkshopCar < ActiveRecord::Base
  belongs_to :car
  has_many :stock_spare_parts
end

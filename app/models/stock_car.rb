# -*- encoding : utf-8 -*-
class StockCar < ActiveRecord::Base
  has_many :stock_car_images
end

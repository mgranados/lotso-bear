# -*- encoding : utf-8 -*-
class StockCar < ActiveRecord::Base
  has_many :stock_car_images
  has_many :stock_families
  has_many :stock_spares
  belongs_to :prevaluation 

  validates :code, uniqueness: true
end

# -*- encoding : utf-8 -*-
class Warehouse < ActiveRecord::Base
  has_many :stock_spares
  has_many :stock_cars
  has_many :orders
end

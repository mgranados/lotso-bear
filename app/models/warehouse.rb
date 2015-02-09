class Warehouse < ActiveRecord::Base
  has_many :stock_spares
  has_many :stock_cars
end

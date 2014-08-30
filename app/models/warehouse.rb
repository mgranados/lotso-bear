class Warehouse < ActiveRecord::Base
  has_many :spareParts
  has_many :cars
end

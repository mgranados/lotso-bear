class Warehouse < ActiveRecord::Base
  has_many :spares
  has_many :cars
end

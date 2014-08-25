class Warehouse < ActiveRecord::Base
  has_many :spareParts, :cars
end

class GenericCar < ActiveRecord::Base
  has_many :cars
  has_many :spareParts
  has_many :sparePartGroups
end
